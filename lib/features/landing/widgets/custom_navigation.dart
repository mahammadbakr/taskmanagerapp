import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskmanagerapp/core/assets/gen/assets.gen.dart';
import 'package:taskmanagerapp/core/responsive.dart';
import 'package:taskmanagerapp/core/theme.dart';
import 'package:taskmanagerapp/features/landing/blocs/main_bloc.dart';

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      bloc: mainBloc,
      builder: (context, state) {
        return Container(
          height: screenHeight(context) * 0.07,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          decoration: ShapeDecoration(
            color: kcBackground,
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 10,
                cornerSmoothing: 0.5,
              ),
            ),
            shadows: const [
              BoxShadow(
                color: kcMidGray,
                blurRadius: 14,
                offset: Offset(0, 10),
                spreadRadius: 0.02,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              navigationTabWidget(
                icon: Assets.icons.home.path,
                context: context,
                label: 'home',
                index: 0,
              ),
              navigationTabWidget(
                icon: Assets.icons.task.path,
                context: context,
                label: 'task',
                index: 1,
              ),
              navigationTabWidget(
                icon: Assets.icons.account.path,
                context: context,
                label: 'account',
                index: 2,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget navigationTabWidget({
    String? icon,
    String? label,
    required BuildContext context,
    required int? index,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () =>
            mainBloc.add(MainBottomNavigationUpdateEvent(index: index ?? 0)),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCrossFade(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  firstChild: SvgPicture.asset(
                    icon!,
                    height: screenHeight(context) * 0.025,
                    color: kcPrimary,
                  ),
                  secondChild: SvgPicture.asset(
                    icon,
                    height:  screenHeight(context) * 0.025,
                    color: kcGrey,
                  ),
                  // make sure the pageController is not null and attached to the PageView
                  crossFadeState: mainBloc.currentIndex == index
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond),
            ],
          ),
        ),
      ),
    );
  }
}
