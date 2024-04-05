import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:taskmanagerapp/core/functions.dart';
import 'package:taskmanagerapp/core/local_storage.dart';
import 'package:taskmanagerapp/core/theme.dart';
import 'package:taskmanagerapp/core/toast.dart';
import 'package:taskmanagerapp/features/task/models/task_model.dart';
import 'package:taskmanagerapp/injectable_config.dart';

part 'task_event.dart';
part 'task_state.dart';

TaskBloc get taskBloc => getIt<TaskBloc>();

@LazySingleton()
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  // list of tasks
  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  // form
  Map<String, dynamic> form = {};
  Map<String, dynamic> get getForm => form;

  TaskBloc() : super(TaskInitial()) {
    on<GetTasksEvent>((event, emit) async {
      try {
        emit(TaskLoadingState());

        // get tasks inside local storage
        final tasks = await localStorageGetString('tasks');

        if (tasks.isNotEmpty) {
          final List<dynamic> data = jsonDecode(tasks);
          _tasks = data.map((e) => TaskModel.fromJson(e)).toList();
          emit(const TaskLoadedState());
        }
      } catch (e) {
        log('error_fetch_tasks:$e');
        showToastFlutter('error_fetch_tasks:$e', color: kcRed);
        emit(TaskErrorState(message: e.toString()));
      }
    });

    on<PostTaskEvent>((event, emit) async {
      try {
        showOverlyLoading();
        
        final newTask = TaskModel.fromJson(form);
        _tasks.add(newTask);

        // save tasks to local storage
        await localStorageSetString('tasks', jsonEncode(_tasks));

        emit(const TaskLoadedState());
        hideOverlyLoading();
      } catch (e) {
        log('error_fetch_user_task:$e');
        showToastFlutter('error_fetch_user_task:$e', color: kcRed);
        hideOverlyLoading();
        emit(TaskErrorState(message: e.toString()));
      }
    });

    on<ClearTaskEvent>((event, emit) {
      _tasks.clear();

      emit(TaskInitial());
    });
  }
}
