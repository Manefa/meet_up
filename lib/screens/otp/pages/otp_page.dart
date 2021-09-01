import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/otp/bloc/otp_bloc.dart';
import 'package:meet_up/features/otp/repository/otp_repository.dart';
import 'package:meet_up/screens/otp/widgets/otp_screen.dart';


import '../../../size_config.dart';

class OtpPage extends StatefulWidget {
  final String phonenumber;
  final OtpRepository _otpRepository = new OtpRepository();
   OtpPage({Key key, @required OtpRepository otpRepository, this.phonenumber}) : super(key: key);

  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  OtpBloc _otpBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(OtpPage.overlayStyle);
    });
    _otpBloc = OtpBloc(
      otpRepo: widget._otpRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
     body: BlocProvider(
        create: (BuildContext context) => _otpBloc,
          child: OtpScreen(phonenumber: widget.phonenumber),
     ),
    );
  }
}
