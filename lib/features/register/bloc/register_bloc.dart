import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meet_up/core/validators/validators.dart';
import 'package:meet_up/features/register/bloc/bloc.dart';
import 'package:meet_up/features/register/repository/register_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _registerRepository;

  RegisterBloc({@required RegisterRepository registerRepository})
      : assert(registerRepository != null),
        _registerRepository = registerRepository, super(RegisterState.empty());

  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(
      Stream<RegisterEvent> events,
      TransitionFunction<RegisterEvent, RegisterState> next,
      ) {
    final observableStream = events as Stream<RegisterEvent>;
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
  Stream<RegisterState> mapEventToState(
      RegisterEvent event,
      ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if(event is PseudoChanged){
      yield* _mapPseudoChangedToState(event.pseudo);
    }else if(event is PhonenumberChanged){
      yield* _mapPhonenumberChangedToState(event.phonenumber);
    }
    else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password, event.phonenumber, event.pseudo);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapPseudoChangedToState(String pseudo) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPseudo(pseudo),
    );
  }

  Stream<RegisterState> _mapPhonenumberChangedToState(String phonenumber) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPhonenumber(phonenumber),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
      String email,
      String password,
      String phonenumber,
      String pseudo,
      ) async* {
    yield RegisterState.loading();
    try {
      await _registerRepository.signUp(pseudo: pseudo, phonenumber: phonenumber, email: email, password: password);
      yield RegisterState.success();
    }  catch (_) {
      yield RegisterState.failure();
    }
  }
}
