import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/features/forgotpassword/bloc/bloc.dart';
import 'package:meet_up/features/forgotpassword/repository/forgotpassword_repository.dart';


class ForgotpasswordBloc extends Bloc<ForgotpasswordEvent, ForgotpasswordState> {
  final ForgotPasswordRepository _forgotPasswordRepository = new ForgotPasswordRepository();
  ForgotpasswordBloc({@required ForgotPasswordRepository forgotPasswordRepository})
      : assert(forgotPasswordRepository != null), super(ForgotpasswordInitial());

  @override
  Stream<ForgotpasswordState> mapEventToState(
    ForgotpasswordEvent event,
  ) async* {
    if(event is SendEmail){
      yield* _mapSendEmailToState(event.email);
    }
  }

  Stream<ForgotpasswordState> _mapSendEmailToState(String email) async* {
    try{
      _forgotPasswordRepository.sendPasswordResetEmail(email);
      yield EmailSend();
    }catch(e){
      yield EmailSendError();
    }
  }
}
