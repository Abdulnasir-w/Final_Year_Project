import 'package:flutter/material.dart';
import 'package:orphankor/Screens/shop_keeper/Screen/Price_enter_scree.dart';
import 'package:orphankor/Screens/shop_keeper/Screen/shopkeeper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(useMaterial3: true),
      home: ShopKeeperScreen(),
    );
  }
}
