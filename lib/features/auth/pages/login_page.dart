import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagerapp/core/form_validator.dart';
import 'package:taskmanagerapp/features/auth/blocs/auth_bloc.dart';
import 'package:taskmanagerapp/features/share/widgets/text_button_widget.dart';
import 'package:taskmanagerapp/features/share/widgets/text_field_widget.dart';
import 'package:taskmanagerapp/features/share/widgets/text_widget.dart';

class LoginPage extends StatelessWidget {
  static const route = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // simple login page
        body: BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
      builder: (context, state) {
        return Form(
          key: authBloc.formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget('Login Page'),
                  const SizedBox(height: 20),
                   TextFieldWidget(
                    hint: 'Email',
                    validator: FormValidator.isEmail,
                    onChanged: (value) {
                      authBloc.form['email'] = value;
                    },
                  ),
                   TextFieldWidget(
                    hint: 'Password',
                    obscureText: true,
                    validator: FormValidator.isPassword,
                    onChanged: (value) {
                      authBloc.form['password'] = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButtonWidget(
                    onPressed: () {
                      if (authBloc.formKey.currentState!.validate()) {
                        authBloc.add(LoginAPIEvent());
                      }
                    },
                    text: 'Login',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
