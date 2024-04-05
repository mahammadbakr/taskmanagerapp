import 'package:flutter/material.dart';
import 'package:taskmanagerapp/features/auth/pages/login_page.dart';
import 'package:taskmanagerapp/features/landing/pages/landing_page.dart';
import 'package:taskmanagerapp/features/landing/pages/splash_page.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  LandingPage.route: (context) => const LandingPage(),
  SplashPage.route: (context) => const SplashPage(),
  LoginPage.route: (context) => const LoginPage(),
};
