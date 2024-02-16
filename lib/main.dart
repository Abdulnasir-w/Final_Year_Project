import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/homeScreen.dart';
import 'Screens/shop_keeper/Screen/shopKeeperScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userLoggedIn = true;
  void getBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userLoggedIn = prefs.getBool('userLoggedIn') ?? false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBool();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(useMaterial3: true),
      home: userLoggedIn ? const ShopKeeperScreen() : const HomeScreen(),
    );
    // home: ShopKeeperScreen());
  }
}
