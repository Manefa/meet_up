import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meet_up/features/otp/bloc/bloc.dart';
import 'package:meet_up/features/otp/repository/otp_repository.dart';


class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpRepository _otpRepo = new OtpRepository();

  OtpBloc({@required OtpRepository otpRepo})
      : assert(otpRepo != null), super(UninitializedState());

  OtpState get initialState => UninitializedState();

  @override
  Stream<OtpState> mapEventToState(OtpEvent event) async* {
    switch (event.name()) {
      case OtpEvents.AppStart:
        yield* mapAppStartToState();
        break;
      case OtpEvents.SendCode:
        yield* mapSendCodeState(event);
        break;
      case OtpEvents.ResendCode:
        yield* mapResendCodeState(event);
        break;
      case OtpEvents.VerifyPhoneNumber:
        yield* mapVerifyPhoneNumberState(event);
        break;
    }
  }

  /// This method checks if the user is authenticated/logged in and sends back the corresponding state.
  /// This is usually done during App Load time to determine if the user is already authenticated or not.
  Stream<OtpState> mapAppStartToState() async* {
    try {
      final isAuthenticated = await _otpRepo.isAuthenticated();
      if (isAuthenticated) {
        yield AuthenticatedState();
      } else {
        yield UnAuthenticatedState();
      }
    } catch (_) {
      yield UnAuthenticatedState();
    }
  }

  /// This state is in response to the event to send sms code to user's phone number.
  Stream<OtpState> mapSendCodeState(OtpEvent event) async* {
    await _otpRepo.verifyPhoneNumber((event as SendCode).phoneNumber);
    yield CodeSentState();
    //await _userRepo.authenticate((event as SendCode).phoneNumber
  }

  /// This state is in response to the event when user wants to the SMS code to be resent.
  /// The code is not regnerated, but the existing code will be sent.
  Stream<OtpState> mapResendCodeState(OtpEvent event) async* {
    await _otpRepo.verifyPhoneNumber((event as SendCode).phoneNumber);
    yield CodeSentState();
  }

  /// This state is in reponse to the event when user enters the SMS code and wants to
  /// sigin with the phone number
  Stream<OtpState> mapVerifyPhoneNumberState(OtpEvent event) async* {
      try{
        AuthCredential authCredential = _otpRepo.signInWithSmsCode((event as VerifyPhoneNumber).smsCode);
        yield AuthenticatedState();
        yield SuccesState();
      }catch(e){
        yield ErrorState();
      }
  }
}