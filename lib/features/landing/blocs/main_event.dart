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

final class ClearMainEvent extends MainEvent {
  const ClearMainEvent();
}