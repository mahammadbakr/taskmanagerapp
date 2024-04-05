import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:taskmanagerapp/core/functions.dart';
import 'package:taskmanagerapp/core/remote_sources.dart';
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

  final Map _form = {};
  Map get form => _form;

  AuthBloc() : super(AuthInitial()) {
    on<LoginAPIEvent>((event, emit) async {
      try {
        // show loading
        showOverlyLoading();
        final res = await RemoteSources.post('login', body: _form);

        final data = jsonDecode(res.body);
        if (res.statusCode == 200 && data['token'] != null) {
          showToastFlutter('login_success');
          await localStorageSetString('token', data['token']);
          emit(LoginSuccessState());
          navigation.pushNamedAndRemoveUntil(
            SplashPage.route,
            (route) => false,
          );
        } else {
          showToastFlutter(data['message'], color: kcRed);
          emit(LoginErrorState(message: data['message']));
        }

        // hide loading
        hideOverlyLoading();
      } catch (e) {
        hideOverlyLoading();
        showToastFlutter('something_went_wrong', color: kcRed);
      }
    });


    on<GetUserAPIEvent>((event, emit) async {
      try {
        // show loading
        showOverlyLoading();

        final res = await RemoteSources.get('users?page=2');

        final data = jsonDecode(res.body);
        if (res.statusCode == 200 && data['data'] != null) {
          // showToastFlutter('get_user_success');
          emit(const GetUserAPISuccessState());
        } else {
          showToastFlutter(data['message'], color: kcRed);
          emit(const GetUserAPIErrorState(message: 'something_went_wrong'));
        }

        hideOverlyLoading();
      } catch (e) {
        hideOverlyLoading();
        showToastFlutter('something_went_wrong', color: kcRed);
        emit(const GetUserAPIErrorState(message: 'something_went_wrong'));
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
        showToastFlutter('something_went_wrong', color: kcRed);
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
