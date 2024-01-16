import 'package:flutter/material.dart';
import 'package:orphankor/Screens/Form/form.dart';
import 'package:orphankor/Screens/shop_keeper/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormsScreen(),
    );
  }
}
