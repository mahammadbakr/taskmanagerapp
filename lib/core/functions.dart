
import 'package:flutter/widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:taskmanagerapp/app.dart';


// for navigation without context
NavigatorState get navigation => navigatorKey.currentState!;
// for global context
BuildContext? get globalContext => globalKey.currentContext!;

// show loading overlay
showOverlyLoading() {
  globalKey.currentContext!.loaderOverlay.show();
}

// hide loading overlay
hideOverlyLoading() {
  globalKey.currentContext!.loaderOverlay.hide();
}

