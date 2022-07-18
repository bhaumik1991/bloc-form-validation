import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/screens/sign_in.dart';
import 'package:flutter_bloc_form_validation/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form Validation",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}

