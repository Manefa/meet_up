import 'package:flutter/material.dart';
import 'package:meet_up/core/bloc/AbstractState.dart';
import 'package:meet_up/features/otp/entities/user_model.dart';


enum OtpStates { UninitializedState, AuthenticatedState, UnAuthenticatedState, CodeSentState, ErrorState, SuccesState }

abstract class OtpState extends AbstractState {
  OtpState() : super();
}

class UninitializedState extends OtpState {
  @override
  OtpStates name() {
    return OtpStates.UninitializedState;
  }
}

/// This is the state when user is authenticated and user object is created.
class AuthenticatedState extends OtpState {
  @override
  List<Object> get props => [];

  @override
  OtpStates name() {
    return OtpStates.AuthenticatedState;
  }
}

/// state when user authentication fails, not sure if its relevant in phone authentication
class UnAuthenticatedState extends OtpState {
  UnAuthenticatedState();

  @override
  List<Object> get props => [];

  @override
  OtpStates name() {
    return OtpStates.UnAuthenticatedState;
  }
}

/// This state is set in response to the event to send sms code to the user.
class CodeSentState extends OtpState {
  CodeSentState();

  @override
  List<Object> get props => [];

  @override
  OtpStates name() {
    return OtpStates.CodeSentState;
  }
}

class ErrorState extends OtpState {
  ErrorState();

  @override
  List<Object> get props => [];

  @override
  OtpStates name() {
    return OtpStates.ErrorState;
  }
}

class SuccesState extends OtpState {
  SuccesState();

  @override
  List<Object> get props => [];

  @override
  OtpStates name() {
    return OtpStates.SuccesState;
  }
}


