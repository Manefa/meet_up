import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordRepository{
  final FirebaseAuth _firebaseAuth;

  ForgotPasswordRepository({FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future sendPasswordResetEmail(String email){
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}