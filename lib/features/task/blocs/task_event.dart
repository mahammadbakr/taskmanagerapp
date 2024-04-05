part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

final class GetTasksEvent extends TaskEvent {
  const GetTasksEvent();
}

final class PostTaskEvent extends TaskEvent {
  const PostTaskEvent();
}

final class ClearTaskEvent extends TaskEvent {
  const ClearTaskEvent();
}