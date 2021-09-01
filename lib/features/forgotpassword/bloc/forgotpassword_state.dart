

import 'package:equatable/equatable.dart';

abstract class ForgotpasswordState extends Equatable {
  const ForgotpasswordState();
}

class ForgotpasswordInitial extends ForgotpasswordState {
  @override
  List<Object> get props => [];
}

class EmailSend extends ForgotpasswordState {
  @override
  List<Object> get props => [];
}

class EmailSendError extends ForgotpasswordState {
  @override
  List<Object> get props => [];
}