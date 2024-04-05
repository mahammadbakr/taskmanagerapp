import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
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

  // formkey
  final formKey = GlobalKey<FormState>();

  // form
  Map<String, dynamic> form = {
    'isDone': false,
  };
  Map<String, dynamic> get getForm => form;

  TaskBloc() : super(TaskInitial()) {
    on<FormUpdateEvent>((event, emit) {
      emit(TaskInitial());
      form = event.form;
      emit(const TaskLoadedState());
    });

    on<GetTasksEvent>((event, emit) async {
      try {
        emit(TaskLoadingState());

        // get tasks inside local storage
        final tasks = await localStorageGetString('tasks');

        if (tasks.isNotEmpty) {
          final List<dynamic> data = jsonDecode(tasks);
          _tasks = data.map((e) => TaskModel.fromJson(e)).toList();

          // sort tasks by date
          _tasks.sort((a, b) => a.date!.compareTo(b.date!));
        }
        emit(const TaskLoadedState());
      } catch (e) {
        log('error_fetch_tasks:$e');
        showToastFlutter('error_fetch_tasks:$e', color: kcRed);
        emit(TaskErrorState(message: e.toString()));
      }
    });

    on<PostTaskEvent>((event, emit) async {
      try {
        emit(TaskLoadingState());
        showOverlyLoading();

        final newTask = TaskModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: form['title'],
          description: form['description'],
          isDone: form['isDone'],
          date: DateTime.parse(form['date']),
        );
        _tasks.add(newTask);
        // sort tasks by date
        _tasks.sort((a, b) => a.date!.compareTo(b.date!));
        // save tasks to local storage
        await localStorageSetString('tasks', jsonEncode(_tasks));
        if (navigation.canPop()) navigation.pop();
        emit(const TaskLoadedState());
        add(const ClearTaskEvent());
        hideOverlyLoading();
      } catch (e) {
        log('error_fetch_user_task:$e');
        showToastFlutter('error_fetch_user_task:$e', color: kcRed);
        hideOverlyLoading();
        emit(TaskErrorState(message: e.toString()));
      }
    });

    on<UpdateTaskEvent>((event, emit) async {
      try {
        emit(TaskLoadingState());
        showOverlyLoading();
        // update task
        _tasks = _tasks.map((e) {
          print(e.id);
          if (e.id == event.task.id) {
            return event.task;
          }
          return e;
        }).toList();

        // sort tasks by date
        _tasks.sort((a, b) => a.date!.compareTo(b.date!));

        // save tasks to local storage
        await localStorageSetString('tasks', jsonEncode(_tasks));
        if (navigation.canPop()) navigation.pop();
        emit(const TaskLoadedState());
        add(const ClearTaskEvent());
        hideOverlyLoading();
      } catch (e) {
        log('error_fetch_user_task:$e');
        showToastFlutter('error_fetch_user_task:$e', color: kcRed);
        hideOverlyLoading();
        emit(TaskErrorState(message: e.toString()));
      }
    });

    on<DeleteTaskEvent>((event, emit) async {
      try {
        emit(TaskLoadingState());
        showOverlyLoading();

        _tasks.removeWhere((element) => element.id == event.task.id);
        // save tasks to local storage
        await localStorageSetString('tasks', jsonEncode(_tasks));
        if (navigation.canPop()) navigation.pop();
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
      form = {
        'isDone': false,
      };
      emit(TaskInitial());
    });
  }
}
