
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterRepository{

  final FirebaseAuth _firebaseAuth;
  CollectionReference users = FirebaseFirestore.instance.collection('USERS');

  RegisterRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

   Future<User> signUp({
    @required String pseudo,
    @required String phonenumber,
    @required String email,
    @required String password,
  })
   async {
     User user;
    try {
       user = await registerWithEmailAndPassword(email: email, password: password,
           phonenumber: phonenumber, pseudo: pseudo);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<User> registerWithEmailAndPassword({@required String pseudo,
    @required String phonenumber,
    @required String email,
    @required String password,}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
     try{
       UserCredential result = await auth.createUserWithEmailAndPassword(
         email: email,
         password: password,
       );
       user = result.user;
       updateUser(uid: user.uid, pseudo: pseudo, email: email, phonenumber: phonenumber, password: password);
     }catch(e){

     }
     return user;
  }

  Future<void> updateUser({@required String uid, @required String pseudo, @required email, @required String phonenumber, @required password}) async{
     return await users.doc(uid).set({
       'id': uid,
       'pseudo': pseudo,
       'email': email,
       'phonenumber': phonenumber,
       'password': password,
     });
  }
}
