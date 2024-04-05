import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:taskmanagerapp/core/functions.dart';
import 'package:taskmanagerapp/core/local_storage.dart';
import 'package:taskmanagerapp/core/remote_sources.dart';
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
  Map form = {};
  Map get getForm => form;

  TaskBloc() : super(TaskInitial()) {
    on<GetTasksEvent>((event, emit) async {
      try {
        final token = await localStorageGetString('token');
        if (token.isEmpty) {
          return;
        }

        emit(TaskLoadingState());
        final Response res = await RemoteSources.get(
          '/app/tasks',
        );
        final data = jsonDecode(res.body);

        if (res.statusCode == 200) {
          _tasks = (data['tasks'] as List)
              .map((e) => TaskModel.fromJson(e))
              .toList();
          emit(const TaskLoadedState());
        } else {
          showToastFlutter(data['message'], color: kcRed);
          emit(TaskErrorState(message: data['message']));
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
        final Response res = await RemoteSources.post(
          '/app/tasks/',
          body: form,
        );
        final data = jsonDecode(res.body);
        if (res.statusCode == 200) {
          if (data['data'] != null) {
            _tasks.add(TaskModel.fromJson(data['data']));
          }
          hideOverlyLoading();
          emit(const TaskLoadedState());
        } else {
          showToastFlutter(data['message'], color: kcRed);
          hideOverlyLoading();
          emit(TaskErrorState(message: data['message']));
        }
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
