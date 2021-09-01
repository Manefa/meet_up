import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/forgotpassword/bloc/bloc.dart';
import 'package:meet_up/features/forgotpassword/repository/forgotpassword_repository.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ResetPasswordScreenOne extends StatefulWidget {
  ResetPasswordScreenOne({Key key,}) : super(key: key);

  @override
  _ResetPasswordScreenOneState createState() => _ResetPasswordScreenOneState();
}

class _ResetPasswordScreenOneState extends State<ResetPasswordScreenOne> {
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );

  static final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
  }

  static ForgotpasswordBloc _forgotpasswordBloc;
  static ForgotPasswordRepository _forgotPasswordRepository  =  new ForgotPasswordRepository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return BlocListener(
      bloc: _forgotpasswordBloc,
      listener: (BuildContext context, ForgotpasswordState state) async {
        if(state is EmailSendError){
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Send Email Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }

        if(state is EmailSend){
          Navigator.pushNamed(context, "/resetpasswordtwo");
        }
      },
      child: BlocBuilder(
        bloc: _forgotpasswordBloc,
        builder: (BuildContext context, ForgotpasswordState state){
          return SafeArea(
            child: SingleChildScrollView(
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
                        "Réinitialiser le mot de passe",
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
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(500),
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
                            "Envoyer les instructions",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            BlocProvider.of<ForgotpasswordBloc>(context).add(SendEmail(_emailController.text.trim()));
                          },
                        ),
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
}
