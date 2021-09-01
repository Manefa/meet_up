

import 'package:equatable/equatable.dart';

abstract class ForgotpasswordEvent extends Equatable {
  const ForgotpasswordEvent();
}

class SendEmail extends ForgotpasswordEvent{
  final String email;
  SendEmail(this.email);
  @override
  List<Object> get props => [email];
}
