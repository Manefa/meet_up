import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/register/bloc/bloc.dart';
import 'package:meet_up/features/register/repository/register_repository.dart';
import 'package:meet_up/screens/register/widgets/register_screen.dart';

class RegisterPage extends StatefulWidget {

  final RegisterRepository _registerRepository = new RegisterRepository();

  RegisterPage({Key key, @required RegisterRepository registerRepository}) :super(key: key);

  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(
      registerRepository: widget._registerRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<RegisterBloc>(
          create: (BuildContext context) => _registerBloc,
          child: RegsiterScreen(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _registerBloc.close();
    super.dispose();
  }
}