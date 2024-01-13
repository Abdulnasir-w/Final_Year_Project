// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:orphankor/Screens/shop_keeper/auth/login_screen.dart';
import 'package:orphankor/Utils/flutter_toast.dart';

class RegisterShopkeeper {
  static Future<void> registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    String apiUrl = "http://localhost/register-shopkeeper";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": name, "email": email, "password": password}),
      );
      if (response.statusCode == 200) {
        ToastUtils.showToast("Register Successful");
        RegisterShopkeeper.registerUser(
            context: context, name: name, email: email, password: password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ShopKeeperLogin()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration failed. Please try again."),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Handle other exceptions that may occur during the request

      // Display a generic error message (replace with your actual error handling)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An error occurred. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
