part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

final class TaskLoadingState extends TaskState {}

final class TaskLoadedState extends TaskState {
  const TaskLoadedState();
}

final class TaskErrorState extends TaskState {
  final String message;

  const TaskErrorState({required this.message});

  @override
  List<Object> get props => [message];
}