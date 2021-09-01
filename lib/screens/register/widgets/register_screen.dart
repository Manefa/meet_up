import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/register/bloc/bloc.dart';
import 'package:meet_up/screens/otp/pages/otp_page.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class RegsiterScreen extends StatefulWidget {
  RegsiterScreen({Key key}) : super(key: key);

  @override
  _RegsiterScreenState createState() => _RegsiterScreenState();
}

class _RegsiterScreenState extends State<RegsiterScreen> {
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );

  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController = TextEditingController();
  static final TextEditingController _pseudoController = TextEditingController();
  static final TextEditingController _phonenumberController = TextEditingController();

  static RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _pseudoController.text.isNotEmpty && _phonenumberController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _phonenumberController.addListener(_onPhonenumberChanged);
    _pseudoController.addListener(_onPseudoChanged);
  }

  bool _isHidden = true;
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return BlocListener(
      bloc: _registerBloc,
      listener: (BuildContext context, RegisterState state) {
        if (state.isSubmitting) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registering...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OtpPage(phonenumber: _phonenumberController.text)),
          );
        }
        if (state.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registration Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder(
        bloc: _registerBloc,
        builder: (BuildContext context, RegisterState state){
          return SingleChildScrollView(
            child: Container(
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(51),
                      ),
                      AutoSizeText(
                        "Créer un nouveau compte",
                        style: TextStyle(
                          fontFamily: "Century Gothic",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(25),
                      ),
                      AutoSizeText(
                        "Lorem ipsum dolor sit amet, consectetur",
                        style: TextStyle(
                          fontFamily: "Century Gothic",
                          fontSize: 16,
                          color: kTextColor,
                        ),
                      ),
                      AutoSizeText(
                        "adipiscing elit, sed do eiusmod tempor",
                        style: TextStyle(
                          fontFamily: "Century Gothic",
                          fontSize: 16,
                          color: kTextColor,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(49),
                      ),
                      Container(
                        height: getProportionateScreenWidth(53),
                        width: getProportionateScreenWidth(353),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 21.0),
                          child: TextFormField(
                            controller: _pseudoController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            autocorrect: false,
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 14,
                              fontFamily: "Century Gothic",
                            ),
                            decoration: InputDecoration(
                              hintText: kPseudolNullError,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: kTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Visibility(
                        child: AutoSizeText(
                          'Pseudo Invalide',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Century Gothic",
                            fontSize: 1,
                          ),
                        ),
                        visible: !state.isPseudoValid,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(45),
                      ),
                      Container(
                        height: getProportionateScreenWidth(53),
                        width: getProportionateScreenWidth(353),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 21.0),
                          child: TextFormField(
                            controller: _emailController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            autocorrect: false,
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 14,
                              fontFamily: "Century Gothic",
                            ),
                            decoration: InputDecoration(
                              hintText: kEmailNullError,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: kTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Visibility(
                        child: AutoSizeText(
                          'Email Invalid',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Century Gothic",
                            fontSize: 1,
                          ),
                        ),
                        visible: !state.isEmailValid,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(45),
                      ),
                      Container(
                        height: getProportionateScreenWidth(53),
                        width: getProportionateScreenWidth(353),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 21.0),
                          child: TextFormField(
                            controller: _phonenumberController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            autocorrect: false,
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 14,
                              fontFamily: "Century Gothic",
                            ),
                            decoration: InputDecoration(
                              hintText: kPhoneNumberNullError,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: kTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Visibility(
                        child: AutoSizeText(
                          'Numero de telephone Invalide',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Century Gothic",
                            fontSize: 1,
                          ),
                        ),
                        visible: !state.isPhonenumberValid,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(45),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: getProportionateScreenWidth(53),
                            width: getProportionateScreenWidth(253),
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 21.0, top: 2),
                              child: TextFormField(
                                obscureText: _isHidden,
                                controller: _passwordController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                autocorrect: false,
                                style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 14,
                                  fontFamily: "Century Gothic",
                                ),
                                decoration: InputDecoration(
                                  hintText: kPassNullError,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: kTextColor,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: kTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getProportionateScreenHeight(53),
                            width: getProportionateScreenWidth(65),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.lock_outlined,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Visibility(
                        child: AutoSizeText(
                          'Mot de passe Invalide',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Century Gothic",
                            fontSize: 1,
                          ),
                        ),
                        visible: !state.isPasswordValid,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(26),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                _value = !_value;
                              });
                            },
                            child: Container(
                              height: getProportionateScreenHeight(32),
                              width: getProportionateScreenWidth(32),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _value ? kSecondaryColor : kPrimaryColor,
                              ),
                              child: _value
                                  ? Icon(
                                Icons.check,
                                size: 16.0,
                                color: kSecondaryColor,
                              )
                                  : Icon(
                                Icons.check,
                                size: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  AutoSizeText(
                                    "J'accepte les  ",
                                    style: TextStyle(
                                      fontFamily: "Century Gothic",
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  AutoSizeText(
                                    "conditions d'utilisation",
                                    style: TextStyle(
                                      fontFamily: "Century Gothic",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  AutoSizeText(
                                    " et la",
                                    style: TextStyle(
                                      fontFamily: "Century Gothic",
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              AutoSizeText(
                                "politique de confidentialité",
                                style: TextStyle(
                                  fontFamily: "Century Gothic",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(130),
                      ),
                      Container(
                        height: getProportionateScreenHeight(53),
                        width: getProportionateScreenWidth(353),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kPrimaryColor,
                        ),
                        child: TextButton(
                          child: AutoSizeText(
                            "S’enregistrer",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _onFormSubmitted();
                          },
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(29),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          AutoSizeText(
                            "Vous avez deja un compte veuillez vous",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(6),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/auth");
                            },
                            child: AutoSizeText(
                              "connecter !",
                              style: TextStyle(
                                fontFamily: "Century Gothic",
                                fontSize: 13,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phonenumberController.dispose();
    _pseudoController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _registerBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onPseudoChanged() {
    _registerBloc.add(
      PseudoChanged(pseudo: _pseudoController.text),
    );
  }

  void _onPhonenumberChanged() {
    _registerBloc.add(
      PhonenumberChanged(phonenumber:_phonenumberController.text),
    );
  }

  static void _onFormSubmitted() {
    _registerBloc.add(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text,
        phonenumber: _phonenumberController.text,
        pseudo: _pseudoController.text,
      ),
    );
  }
}
