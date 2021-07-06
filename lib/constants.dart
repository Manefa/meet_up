import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF5A4CB1);
const kPrimaryLightColor = Color(0xFFDEDBEF);

const kSecondaryColor = Color(0xFFF0F1F2);
const kTextColor = Color(0xFF7B868B);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Entrer votre adresse email";
const String kInvalidEmailError = "Veuillez entrer une adresse email valide";
const String kPassNullError = "Entrer votre mot de passe";
const String kShortPassError = "Mot de passe trop court";
const String kMatchPassError = "Le mot de passe ne correspond pas";
const String kPseudolNullError = "Entrer votre pseudo";
const String kPhoneNumberNullError = "Entrer votre numero de telephone";
const String kAddressNullError = "Votre adresse ne corresponds pas";
