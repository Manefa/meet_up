import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]);
}

class EmailChanged extends RegisterEvent {
  final String email;

  EmailChanged({@required this.email}) : super([email]);

  @override
  String toString() => 'EmailChanged { email :$email }';

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  final String password;

  PasswordChanged({@required this.password}) : super([password]);

  @override
  String toString() => 'PasswordChanged { password: $password }';

  @override
  List<Object> get props => [password];
}

class PhonenumberChanged extends RegisterEvent {
  final String phonenumber;

  PhonenumberChanged({@required this.phonenumber}) : super([phonenumber]);

  @override
  String toString() => 'PasswordChanged { password: $phonenumber }';

  @override
  List<Object> get props => [phonenumber];
}

class PseudoChanged extends RegisterEvent {
  final String pseudo;

  PseudoChanged({@required this.pseudo}) : super([pseudo]);

  @override
  String toString() => 'PasswordChanged { password: $pseudo }';

  @override
  List<Object> get props => [pseudo];
}

class Submitted extends RegisterEvent {
  final String email;
  final String password;
  final String phonenumber;
  final String pseudo;

  Submitted({@required this.email, @required this.password, @required this.phonenumber, @required this.pseudo})
      : super([email, password, phonenumber, pseudo]);

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password , phonenumber: $phonenumber, pseudo: $pseudo}';
  }

  @override
  List<Object> get props => [email, password, phonenumber, pseudo];
}