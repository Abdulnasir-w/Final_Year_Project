import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Screens/shop_keeper/Screen/shopKeeperScreen.dart';

class ShopkeeperAuthLogin {
  static Future<bool> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    const String apiUrl = "https://idrees.blogvali.com/api/login";
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
        final String authToken = data['authorisation']['token'];
        await _saveToken(authToken);
        Fluttertoast.showToast(msg: "Login Successful");
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopKeeperScreen()));
        return true;
      } else {
        Fluttertoast.showToast(msg: "Try Again");
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login failed. Please check your credentials."),
            backgroundColor: Colors.red,
          ),
        );
        return false;
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
      return false;
    }
  }

  static Future<void> _saveToken(String token) async {
    //Using SharedPreference to save the authentication token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('userLoggedIn', true);
    await prefs.setString("authToken", token);
  }
}
