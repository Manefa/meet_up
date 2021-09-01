import 'dart:async';
import 'package:meet_up/core/validators/validators.dart';
import 'package:meet_up/features/auth/blocs/login/bloc/login_event.dart';
import 'package:meet_up/features/auth/blocs/login/bloc/login_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:meet_up/features/auth/blocs/login/bloc/bloc.dart';
import 'package:meet_up/features/auth/repository/auth_repository.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository _authRepository;

  LoginBloc({
    @required AuthRepository authRepository,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        super(LoginState.empty());

  LoginState get initialState => LoginState.empty();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
    Stream<LoginEvent> events,
    TransitionFunction<LoginEvent, LoginState> next,
  ) {
    final observableStream = events as Stream<LoginEvent>;
    final nonDebounceStream = observableStream.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });
    final debounceStream = observableStream.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounce((_) => TimerStream(true, const Duration(milliseconds: 300)));
    return super.transformEvents(
        MergeStream([nonDebounceStream, debounceStream]), next);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithFacebookPressedToState();
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<LoginState> _mapLoginWithFacebookPressedToState() async* {
    try {
      await _authRepository.signInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      await _authRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
