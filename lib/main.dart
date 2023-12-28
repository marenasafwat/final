// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin.page/home_page.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/student.page/readstudent.dart';
import 'package:flutter_application_1/admin.page/stuact_page.dart';
import 'package:flutter_application_1/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 42, 56, 214)),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}
