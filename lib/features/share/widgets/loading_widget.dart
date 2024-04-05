import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskmanagerapp/core/theme.dart';


// global loading widget for loading data
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 45,
        height: 45,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        )
      ),
    );
  }
}

// loading shimmer widget for loading data
class LoadingShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;
  const LoadingShimmerWidget({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: kcDivider.withOpacity(0.2),
        highlightColor: kcDivider.withOpacity(0.6),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: kcDivider,
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
      ),
    );
  }
}
