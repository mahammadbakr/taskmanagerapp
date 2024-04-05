import 'package:flutter/material.dart';
import 'package:taskmanagerapp/core/responsive.dart';
import 'package:taskmanagerapp/features/share/widgets/loading_widget.dart';
class TaskShimmer extends StatelessWidget {
  const TaskShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          children: [
            ...List.generate(
              5,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: LoadingShimmerWidget(
                  width: screenWidth(context),
                  // random height for shimmer
                  height: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
