import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/auth/blocs/login/bloc/bloc.dart';
import 'package:meet_up/features/auth/blocs/login/bloc/login_bloc.dart';
import 'package:meet_up/features/auth/repository/auth_repository.dart';
import 'package:meet_up/screens/auth/widgets/auth.dart';

class AuthScreen extends StatefulWidget {
  final AuthRepository _authRepository;

  AuthScreen({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  LoginBloc _loginBloc;

  AuthRepository get _authRepository => widget._authRepository;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(
      authRepository: _authRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<LoginBloc>(
          create: (BuildContext context) => _loginBloc,
          child: AuthPageTrue(authRepository: _authRepository),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }
}
