import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {
  @override
  List<Object> get props => ["AppStarted"];
}

class LoggedIn extends AuthEvent {
  @override
  List<Object> get props => ["LoggedIn"];
}

class LoggedOut extends AuthEvent {
  @override
  List<Object> get props => ["LoggedOut"];
}
