import 'package:flutter/material.dart';
import 'package:taskmanagerapp/core/functions.dart';
import 'package:taskmanagerapp/core/local_storage.dart';
import 'package:taskmanagerapp/core/theme.dart';
import 'package:taskmanagerapp/features/auth/blocs/auth_bloc.dart';
import 'package:taskmanagerapp/features/auth/pages/login_page.dart';
import 'package:taskmanagerapp/features/landing/pages/landing_page.dart';
import 'package:taskmanagerapp/features/share/widgets/loading_widget.dart';

class SplashPage extends StatefulWidget {
  static const route = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // navigate to the landing page after 1 milliseconds
    Future.delayed(const Duration(milliseconds: 1), () async {
      final token = await localStorageGetString('token');
      if (token.isEmpty || token == '') {
        navigation.pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
      } else {
        navigation.pushNamedAndRemoveUntil(LandingPage.route, (route) => false);
        authBloc.add(const GetUserAPIEvent());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.lightTheme,
      child: const Scaffold(
        backgroundColor: kcWhite,
        body: LoadingWidget(),
      ),
    );
  }
}
