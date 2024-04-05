import 'package:flutter/material.dart';
import 'package:taskmanagerapp/core/assets/gen/assets.gen.dart';
import 'package:taskmanagerapp/core/responsive.dart';

class TasksEmpty extends StatelessWidget {
  const TasksEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.icons.empty.path,
          width: screenWidth(context) / 3,
        ),
        const Text(
          'no_tasks',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
