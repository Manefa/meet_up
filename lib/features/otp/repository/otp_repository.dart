import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/features/otp/entities/user_model.dart';

class OtpRepository{

  final FirebaseAuth _firebaseAuth;
  String _verificationCode = "";

  OtpRepository({FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  /// This method sends the SMS code to the phone number to verify the number
  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
     await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+237" + phoneNumber,
        timeout: Duration(seconds: 5),
        verificationCompleted: (authCredential) => _verificationComplete(authCredential),
        // if there is an exception, get the exception message and set it to the return value
        verificationFailed: (authException) => _verificationFailed(authException),
        codeAutoRetrievalTimeout: (verificationId) => _codeAutoRetrievalTimeout(verificationId),
        // called when the SMS code is sent
        codeSent: (verificationId, [code]) => _smsCodeSent(verificationId, [code]));
  }


  Future<UserApp> getUser() async {
    /// ?? Looks like firebase user table has most of the required information, need to check if we need a application level table
    User firebaseUser =  _firebaseAuth.currentUser;
    UserApp uSerApp = UserApp(userId: firebaseUser.uid, userName: firebaseUser.displayName, phoneNum: firebaseUser.phoneNumber);
    return uSerApp;
  }

  Future<bool> isAuthenticated() async {
    final currentUser =  _firebaseAuth.currentUser;
    // return true or false depending on whether we have a current user
    return currentUser != null;
  }

  /// will get an AuthCredential object that will help with logging into Firebase.
  _verificationComplete(AuthCredential authCredential) {
    // FirebaseAuth.instance.signInWithCredential(authCredential).then((authResult) {});
  }

  void _smsCodeSent(String verificationCode, List<int> code) {
    // set the verification code so that we can use it to log the user in
    this._verificationCode = verificationCode;
  }

  String _verificationFailed(FirebaseAuthException authException) {
    return authException.message;
  }

  void _codeAutoRetrievalTimeout(String verificationCode) {
    // set the verification code so that we can use it to log the user in
    this._verificationCode = verificationCode;
  }

  // smsCode is the code that is sent to the users phone that they enter in the textfield
  // At this point user's phone number is not required, the verification code is generated based on sms code sent to user's phone
  AuthCredential signInWithSmsCode(String smsCode) {
    debugPrint("verif in sign in" + _verificationCode);
    debugPrint("smsCode" + smsCode.toString());
    User _user;
    // PhoneAuthProvider will create a AuthCredential object with sms code and verification code (this is generated when sms is sent to the suser)
    AuthCredential authCredential = PhoneAuthProvider.credential(smsCode: smsCode, verificationId: _verificationCode);
    return authCredential;
  }
}