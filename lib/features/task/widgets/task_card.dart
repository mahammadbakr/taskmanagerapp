import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskmanagerapp/core/assets/gen/assets.gen.dart';
import 'package:taskmanagerapp/core/functions.dart';
import 'package:taskmanagerapp/core/theme.dart';
import 'package:taskmanagerapp/features/task/blocs/task_bloc.dart';
import 'package:taskmanagerapp/features/task/models/task_model.dart';
import 'package:taskmanagerapp/features/task/pages/add_edit_task_page.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.icons.task.path,
                width: 30,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    task.date?.toIso8601String().split('T')[0] ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      taskBloc.add(UpdateTaskEvent(
                        task: task.copyWith(isDone: !task.isDone),
                      ));
                    },
                    icon: task.isDone
                        ? const Icon(Icons.check_circle, color: kcGreen)
                        : const Icon(Icons.circle, color: kcGrey),
                  ),
                  IconButton(
                    onPressed: () {
                      taskBloc.add(DeleteTaskEvent(task: task));
                    },
                    icon: const Icon(Icons.delete, color: kcRed),
                  ),
                  IconButton(
                    onPressed: () {
                      taskBloc.add(FormUpdateEvent(form: {
                        ...task.toJson(),
                        'edit': true
                      }));
                      navigation.pushNamed(AddEdiTaskPage.route);
                    },
                    icon: const Icon(Icons.edit, color: kcBlue),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            task.description ?? '',
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
