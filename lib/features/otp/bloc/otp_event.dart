import 'package:flutter/material.dart';
import 'package:meet_up/core/bloc/AbstractEvent.dart';

enum OtpEvents { AppStart, SendCode, ResendCode, VerifyPhoneNumber }

class OtpEvent extends AbstractEvent {
  @override
  name() {
    return null;
  }
}

/// This is the event triggered when App is starting - user not logged in
class AppStart extends OtpEvent {
  @override
  OtpEvents name() {
    return OtpEvents.AppStart;
  }
}

/// This is the event triggered when user enters phone number to send a code
class SendCode extends OtpEvent {
  final String phoneNumber;

  SendCode({@required this.phoneNumber});

  @override
  OtpEvents name() {
    return OtpEvents.SendCode;
  }
}

/// Event to resend the sms code to user
class ResendCode extends OtpEvent {
  @override
  OtpEvents name() {
    return OtpEvents.ResendCode;
  }
}

/// Event that is triggered when user enters the sms code and initiates phone number verification
class VerifyPhoneNumber extends OtpEvent {
  final String smsCode;

  VerifyPhoneNumber({@required this.smsCode});
  @override
  OtpEvents name() {
    return OtpEvents.VerifyPhoneNumber;
  }
}