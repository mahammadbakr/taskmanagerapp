part of 'main_bloc.dart';

sealed class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

final class MainInitial extends MainState {}

final class MainBottomNavigationUpdateState extends MainState {}

final class GetHomeAPIState extends MainState {}

final class GetUserAPIState extends MainState {}

final class LocationUpdateState extends MainState {}

final class OneSignalUpdateState extends MainState {}


final class NotificationLoadedState extends MainState {}

final class NotificationsLoadingState extends MainState {}

final class NotificationsErrorState extends MainState {
  final String message;

  const NotificationsErrorState(this.message);

  @override
  List<Object> get props => [message];
}


final class PostsLoadingState extends MainState {}

final class PostsLoadedState extends MainState {}

final class PostsErrorState extends MainState {
  final String message;

  const PostsErrorState(this.message);

  @override
  List<Object> get props => [message];
}

final class AdsLoadingState extends MainState {}

final class AdsLoadedState extends MainState {}

final class AdsErrorState extends MainState {
  final String message;

  const AdsErrorState(this.message);

  @override
  List<Object> get props => [message];
}


final class RewardsLoadingState extends MainState {}

final class RewardsLoadedState extends MainState {}

final class RewardsErrorState extends MainState {
  final String message;

  const RewardsErrorState(this.message);

  @override
  List<Object> get props => [message];
}


final class ZikrsLoadingState extends MainState {}

final class ZikrsLoadedState extends MainState {}

final class ZikrsErrorState extends MainState {
  final String message;

  const ZikrsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
