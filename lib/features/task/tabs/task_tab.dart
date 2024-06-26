import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagerapp/core/functions.dart';
import 'package:taskmanagerapp/core/responsive.dart';
import 'package:taskmanagerapp/features/task/blocs/task_bloc.dart';
import 'package:taskmanagerapp/features/task/pages/add_edit_task_page.dart';
import 'package:taskmanagerapp/features/task/widgets/task_card.dart';
import 'package:taskmanagerapp/features/task/widgets/tasks_empty.dart';
import 'package:taskmanagerapp/features/task/widgets/tasks_shimmer.dart';


class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      bloc: taskBloc..add(const GetTasksEvent()),
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context),
              child: state is TaskLoadingState
                  ? const TaskShimmer()
                  : taskBloc.tasks.isEmpty
                      ? const TasksEmpty()
                      : ListView.builder(
                          itemCount: taskBloc.tasks.length,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          itemBuilder: (ctx, index) => TaskCard(
                            task: taskBloc.tasks[index],
                          ),
                        ),
            ),

            // add button
            Positioned(
              bottom: 0,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  // navigate to add task screen
                  navigation.pushNamed(AddEdiTaskPage.route);
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        );
      },
    );
  }
}
