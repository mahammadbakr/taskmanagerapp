import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanagerapp/core/assets/gen/assets.gen.dart';
import 'package:taskmanagerapp/core/responsive.dart';
import 'package:taskmanagerapp/core/theme.dart';

class TasksEmpty extends StatelessWidget {
  const TasksEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.icons.empty.path,
          width: screenWidth(context) / 5,
          colorFilter: const ColorFilter.mode(
            kcPrimary,
            BlendMode.srcIn,
          )
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
