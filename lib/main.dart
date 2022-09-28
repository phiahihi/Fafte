import 'package:chat_app_b/routes/route_generator.dart';
import 'package:chat_app_b/routes/routes.dart';

import '/Authenticate/Autheticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: globalnavigatorKey,
    );
  }
}
