part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginAPIEvent extends AuthEvent {}


final class GetUserAPIEvent extends AuthEvent {
  const GetUserAPIEvent();
}

class LogoutEvent extends AuthEvent {}