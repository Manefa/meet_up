import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/forgotpassword/bloc/bloc.dart';
import 'package:meet_up/features/forgotpassword/repository/forgotpassword_repository.dart';
import 'package:meet_up/features/otp/repository/otp_repository.dart';
import 'package:meet_up/screens/resetpassword/widgets/reset_password_screen_one.dart';


import '../../../size_config.dart';

class ResetPasswordPageOne extends StatefulWidget {
  final ForgotPasswordRepository _forgotPasswordRepository = new ForgotPasswordRepository();
  ResetPasswordPageOne({Key key, @required OtpRepository otpRepository,}) : super(key: key);

  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );

  @override
  _ResetPasswordPageOneState createState() => _ResetPasswordPageOneState();
}

class _ResetPasswordPageOneState extends State<ResetPasswordPageOne> {

  ForgotpasswordBloc _forgotpasswordBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(ResetPasswordPageOne.overlayStyle);
    });
    _forgotpasswordBloc = ForgotpasswordBloc(
        forgotPasswordRepository: widget._forgotPasswordRepository
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => _forgotpasswordBloc,
        child: ResetPasswordScreenOne(),
      ),
    );
  }
}