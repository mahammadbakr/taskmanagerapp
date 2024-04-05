
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taskmanagerapp/core/functions.dart';
import 'package:taskmanagerapp/core/theme.dart';
import 'package:taskmanagerapp/features/auth/models/user_model.dart';
import 'package:taskmanagerapp/features/landing/pages/splash_page.dart';
import 'package:taskmanagerapp/injectable_config.dart';
import '../../../../core/local_storage.dart';
import '../../../../core/toast.dart';

part 'auth_event.dart';
part 'auth_state.dart';

AuthBloc get authBloc => getIt<AuthBloc>();

@LazySingleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // authForm
  final formKey = GlobalKey<FormState>();

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  AuthBloc() : super(AuthInitial()) {
    on<LoginAPIEvent>((event, emit) async {
      try {
        // show loading
        showOverlyLoading();

        // toddo: add your api here

        // hide loading
        hideOverlyLoading();
      } catch (e) {
        print('error: $e');
        hideOverlyLoading();
        showToastFlutter('کێشەیەک ڕوویدا', color: kcRed);
      }
    });

    // logout
    on<LogoutEvent>((event, emit) async {
      try {
        _userModel = null;
        await localStorageSetString('token', '');

        // navigate to splash page
        navigation.pushNamedAndRemoveUntil(
          SplashPage.route,
          (route) => false,
        );
      } catch (e) {
        showToastFlutter('کێشەیەک ڕوویدا', color: kcRed);
        await localStorageSetString('token', '');

        // navigate to splash page
        navigation.pushNamedAndRemoveUntil(
          SplashPage.route,
          (route) => false,
        );
      }
    });
  }
}
