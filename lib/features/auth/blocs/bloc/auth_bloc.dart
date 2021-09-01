import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meet_up/features/auth/repository/auth_repository.dart';

import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc({@required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(Uninitialized());

  AuthState get initialState => Uninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _authRepository.isSignedIn();
      if (isSignedIn) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthState> _mapLoggedInToState() async* {
    yield Authenticated();
  }

  Stream<AuthState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _authRepository.signOut();
  }
}
