// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'foodDataHandling.dart';

class FoodApi {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    return token;
  }

  Future<List<Food>> getFoodData(String otp) async {
    final token = await getToken();

    final response = await http.get(
        Uri.parse("https://idrees.blogvali.com/api/get_single_rashion/$otp"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });

    final jsonResponse = json.decode(response.body)['message'];
    List foodItems = jsonResponse['reportrashion'];

    List<Food> foodList = [];

    for (var item in foodItems) {
      foodList.add(Food(
          id: item['id'].toString(),
          foodName: item['name'].toString(),
          userId: item['id'].toString(),
          quantity: item['qty'].toString(),
          otp: jsonResponse['id'].toString()));
    }

    if (response.statusCode == 200) {
      return foodList;
    } else {
      //print('Error: ${response.statusCode}');
      return [];
    }
  }
}
