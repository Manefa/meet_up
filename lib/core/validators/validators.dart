class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static final RegExp _pseudoRegExp = RegExp(
    r'^([a-zA-Z0-9-_]{2,36})$',
  );

  static final RegExp _phonenumberRegExp = RegExp(
    r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidPseudo(String pseudo) {
    return _pseudoRegExp.hasMatch(pseudo);
  }

  static isValidPhonenumber(String phonenumber) {
    return _phonenumberRegExp.hasMatch(phonenumber);
  }
}
