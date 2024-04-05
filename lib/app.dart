import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:taskmanagerapp/core/routes.dart';
import 'package:taskmanagerapp/core/theme.dart';
import 'package:taskmanagerapp/features/landing/pages/splash_page.dart';
import 'package:taskmanagerapp/features/share/widgets/loading_widget.dart';

// for global key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey globalKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: kcWhite.withOpacity(0.5),
      overlayWidget: const LoadingWidget(),
      child: MaterialApp(
        key: globalKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Task Manager App',
        theme: AppTheme.lightTheme,
        routes: routes,
        initialRoute: SplashPage.route,         
      ),
    );
  }
}
