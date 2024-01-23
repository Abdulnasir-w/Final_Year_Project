import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:orphankor/Screens/shop_keeper/Screen/shopkeeper.dart';
import 'package:orphankor/Utils/flutter_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        final Map<String, dynamic> data = json.decode(response.body);
        final String authToken = data['token'];
        await _saveToken(authToken);
        ToastUtils.showToast("Login Successful");
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopKeeperScreen()));
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

  static Future<void> _saveToken(String token) async {
    //Using SharedPreference to save the authentication token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("authToken", token);
  }
}
