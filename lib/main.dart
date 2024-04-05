import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskmanagerapp/app.dart';
import 'package:taskmanagerapp/core/logger.dart';
import 'package:taskmanagerapp/injectable_config.dart';


void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // set up dependency injection
      configureDependencies();
      // set up hydrated bloc
      HydratedBloc.storage = await HydratedStorage.build(
          storageDirectory: kIsWeb
              ? HydratedStorage.webStorageDirectory
              : await getTemporaryDirectory());
  
      runApp(const MyApp());
    },
    (error, stackTrace) {
      LoggerApp.logger
          .e('runZonedGuarded', error: error, stackTrace: stackTrace);
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String message)async {  
         // Disable print statements in release mode
        if (!kReleaseMode) {
          parent.print(zone, message);
        }
      },
    ),
  );
}
