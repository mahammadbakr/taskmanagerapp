part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

final class GetTasksEvent extends TaskEvent {
  const GetTasksEvent();
}

final class FormUpdateEvent extends TaskEvent {
  final Map<String, dynamic> form;
  const FormUpdateEvent({
    required this.form,
  });

  @override
  List<Object> get props => [form];
}

final class PostTaskEvent extends TaskEvent {
  const PostTaskEvent();
}

final class UpdateTaskEvent extends TaskEvent {
  final TaskModel task;
  const UpdateTaskEvent({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

final class DeleteTaskEvent extends TaskEvent {
  final TaskModel task;
  const DeleteTaskEvent({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

final class ClearTaskEvent extends TaskEvent {
  const ClearTaskEvent();
}