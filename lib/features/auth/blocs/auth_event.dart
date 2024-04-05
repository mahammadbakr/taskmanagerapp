part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginAPIEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}