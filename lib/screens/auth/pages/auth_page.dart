import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/auth/blocs/bloc/bloc.dart';
import 'package:meet_up/features/auth/repository/auth_repository.dart';
import 'package:meet_up/screens/auth/widgets/auth_screen.dart';
import 'package:meet_up/screens/home/pages/home_page.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );

  final AuthRepository _authRepository = AuthRepository();
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });

    _authBloc = AuthBloc(authRepository: _authRepository);
    _authBloc.add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _authBloc,
      child: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Uninitialized) {
              return AuthScreen(authRepository: _authRepository);
            } else if (state is Authenticated) {
              return HomePage(
                name: state.displayName,
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }
}
