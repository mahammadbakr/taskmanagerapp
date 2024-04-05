import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagerapp/core/form_validator.dart';
import 'package:taskmanagerapp/features/share/widgets/date_picker_widget.dart';
import 'package:taskmanagerapp/features/share/widgets/text_button_widget.dart';
import 'package:taskmanagerapp/features/share/widgets/text_field_widget.dart';
import 'package:taskmanagerapp/features/share/widgets/text_widget.dart';
import 'package:taskmanagerapp/features/task/blocs/task_bloc.dart';
import 'package:taskmanagerapp/features/task/models/task_model.dart';

class AddEdiTaskPage extends StatelessWidget {
  static const route = '/add_edit_task';
  const AddEdiTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'Task Manager',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        bloc: taskBloc,
        builder: (context, state) {
          print(taskBloc.form);
          return Form(
              key: taskBloc.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    TextFieldWidget(
                      label: 'title',
                      hint: 'title',
                      initialValue: taskBloc.form['title'],
                      validator: FormValidator.isRequired,
                      onChanged: (value) {
                        taskBloc.form['title'] = value;
                      },
                    ),
                    TextFieldWidget(
                      label: 'description',
                      hint: 'description',
                      initialValue: taskBloc.form['description'],
                      validator: FormValidator.isRequired,
                      maxLines: 3,
                      onChanged: (value) {
                        taskBloc.form['description'] = value;
                      },
                    ),
                    DatePickerWidget(
                      label: 'Date',
                      hint: 'Date',
                      controller: taskBloc.form['date'] != null
                          ? TextEditingController(
                              text: taskBloc.form['date']
                                  ?.toString()
                                  .split('T')[0])
                          : TextEditingController(),
                      validator: FormValidator.isRequired,
                      onChanged: (value) {
                        taskBloc.add(FormUpdateEvent(form: {
                          ...taskBloc.form,
                          'date': value?.toIso8601String(),
                        }));
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButtonWidget(
                      text: taskBloc.form['edit'] == true
                          ? 'Update Task'
                          : 'Add Task',
                      onPressed: () {
                        if (taskBloc.formKey.currentState!.validate()) {
                          if (taskBloc.form['edit'] == true) {
                            taskBloc.add(UpdateTaskEvent(
                                task: TaskModel.fromJson(taskBloc.form)));
                          } else {
                            taskBloc.add(const PostTaskEvent());
                          }
                        }
                      },
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
