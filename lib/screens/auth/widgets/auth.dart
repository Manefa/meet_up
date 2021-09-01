import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/auth/blocs/bloc/bloc.dart';
import 'package:meet_up/features/auth/blocs/login/bloc/login_bloc.dart';
import 'package:meet_up/features/auth/blocs/login/bloc/login_event.dart';
import 'package:meet_up/features/auth/blocs/login/bloc/login_state.dart';
import 'package:meet_up/features/auth/repository/auth_repository.dart';
import 'package:meet_up/size_config.dart';

import '../../../constants.dart';

class AuthPageTrue extends StatefulWidget {
  final AuthRepository _authRepository;

  AuthPageTrue({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  @override
  _AuthPageTrueState createState() => _AuthPageTrueState();
}

class _AuthPageTrueState extends State<AuthPageTrue> {
   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  AuthRepository get _authRepository => widget._authRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return BlocListener(
      bloc: _loginBloc,
      listener: (BuildContext context, LoginState state) {
        if (state.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Login Failure'), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
                backgroundColor: Colors.white,
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder(
        bloc: _loginBloc,
        builder: (BuildContext context, LoginState state) {
          return SingleChildScrollView(
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
                      "Content de vous revoir",
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
                          controller: _emailController,
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autocorrect: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Visibility(
                      child: AutoSizeText(
                        'Email Invalide',
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
                              controller: _passwordController,
                              autocorrect: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: _isHidden,
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
                      height: getProportionateScreenHeight(34),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/resetpasswordpageone");
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: AutoSizeText(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            fontFamily: "Century Gothic",
                            fontSize: 14,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(38),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: getProportionateScreenWidth(120),
                          height: getProportionateScreenHeight(1),
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(18),
                        ),
                        AutoSizeText(
                          "ou encore",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                            fontFamily: "Century Gothic",
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(18),
                        ),
                        Container(
                          width: getProportionateScreenWidth(120),
                          height: getProportionateScreenHeight(1),
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(38),
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<LoginBloc>(context)
                            .add(LoginWithGooglePressed());
                      },
                      child: Container(
                        height: getProportionateScreenHeight(53),
                        width: getProportionateScreenWidth(353),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: getProportionateScreenHeight(27),
                                width: getProportionateScreenWidth(27),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: new AssetImage(
                                        "images/icons_google.png"),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(25),
                              ),
                              AutoSizeText(
                                "Se connecter avec google",
                                style: TextStyle(
                                  fontFamily: "Century Gothic",
                                  fontSize: 14,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(190),
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
                          "Se connecter",
                          style: TextStyle(
                            fontFamily: "Century Gothic",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginWithCredentialsPressed(
                                  email: _emailController.text,
                                  password: _passwordController.text));
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
                          "Vous n’avez pas de compte veuillez vous",
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
                            Navigator.pushNamed(context, "/register");
                          },
                          child: AutoSizeText(
                            "enregistrer !",
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
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
