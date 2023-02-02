import 'package:dailyAffirmationss/core/di/di.dart';
import 'package:dailyAffirmationss/core/navigation/app_router.gr.dart';
import 'package:dailyAffirmationss/core/networking/network_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

part './root_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _initInjector();
  _initNetworkService();
  runApp(App());
}

void _initInjector() {
  Injector.setUp();
}

void _initNetworkService() {
  (Injector.resolve<NetworkService>() as NetworkService).init();
}
