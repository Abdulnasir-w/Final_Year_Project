import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:orphankor/Screens/shop_keeper/shopkeeper.dart';
import 'package:orphankor/Utils/flutter_toast.dart';

class ShopkeeperAuthLogin {
  static Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    const String apiUrl = "http://localhost/login-shopkeeper";
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      if (response.statusCode == 200) {
        ToastUtils.showToast("Login Successful");
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShooKeeper()));
      } else {
        ToastUtils.showToast("Try Again");
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login failed. Please check your credentials."),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Display a generic error message (replace with your actual error handling)
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An error occurred. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
