import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagerapp/core/functions.dart';
import 'package:taskmanagerapp/core/local_storage.dart';
import 'package:taskmanagerapp/core/responsive.dart';
import 'package:taskmanagerapp/features/auth/pages/login_page.dart';
import 'package:taskmanagerapp/features/landing/blocs/main_bloc.dart';
import 'package:taskmanagerapp/features/landing/tabs/account_tab.dart';
import 'package:taskmanagerapp/features/landing/tabs/home_tab.dart';
import 'package:taskmanagerapp/features/landing/widgets/custom_navigation.dart';
import 'package:taskmanagerapp/features/task/tabs/task_tab.dart';

class LandingPage extends StatefulWidget {
  static const route = '/';
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1), () async {
      final token = await localStorageGetString('token');
      if (token.isEmpty) {
        navigation.pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
      }
      // if (authBloc.userModel == null) {
      //   mainBloc.add(const GetUserAPIEvent());
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      bloc: mainBloc,
      builder: (context, state) {
        return Scaffold(
          // appBar: customAppbar(context: context),
          body: SafeArea(
            bottom: false,
            left: false,
            right: false,
            child: Container(
              height: screenHeight(context),
              decoration: const ShapeDecoration(shape: 
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                color: Colors.white,
              ),
              child: _tabs[mainBloc.currentIndex],
            ),
          ),
          bottomNavigationBar: const CustomNavigation(),
        );
      },
    );
  }
}

List<Widget> _tabs = [
  const HomeTab(),
  const TaskTab(),
  const AccountTab(),
];
