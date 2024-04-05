part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginErrorState extends AuthState {
  final String message;
  const LoginErrorState({required this.message});

  @override
  List<Object> get props => [message];
}


final class GetUserAPIState extends AuthState {}

final class GetUserAPISuccessState extends AuthState {
  const GetUserAPISuccessState();
}

final class GetUserAPIErrorState extends AuthState {
  final String message;
  const GetUserAPIErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
