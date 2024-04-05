part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

final class MainBottomNavigationUpdateEvent extends MainEvent {
  final int index;

  const MainBottomNavigationUpdateEvent({required this.index});

  @override
  List<Object> get props => [index];
}

final class GetHomeAPIEvent extends MainEvent {
  const GetHomeAPIEvent();
}

final class GetUserAPIEvent extends MainEvent {
  const GetUserAPIEvent();
}

final class SyncLocationEvent extends MainEvent {
  final String latitude;
  final String longitude;
  const SyncLocationEvent(
      {required this.latitude, required this.longitude}
  );
}

final class SyncOneSignalEvent extends MainEvent {
  const SyncOneSignalEvent();
}


final class GetNotificationsEvent extends MainEvent {
  const GetNotificationsEvent();
}


final class GetPostsEvent extends MainEvent {
  const GetPostsEvent();
}


final class GetAdsEvent extends MainEvent {
  const GetAdsEvent();
}

final class GetRewardsEvent extends MainEvent {
  const GetRewardsEvent();
}

final class GetZikrsEvent extends MainEvent {
  const GetZikrsEvent();
}

final class ClearMainEvent extends MainEvent {
  const ClearMainEvent();
}