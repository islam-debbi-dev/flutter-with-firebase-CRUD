import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'routers/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //   apiKey: "YOUR_API_KEY",
      //   appId: "YOUR_APP_ID",
      //   messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      //   projectId: "YOUR_PROJECT_ID",
      // ),
      );

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with Firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.generateRoutes,
      initialRoute: '/',
    );
  }
}
