import 'dart:convert';

import 'package:orphankor/Models/Food/food_data_handling.dart';
import 'package:http/http.dart' as http;

class FoodApi {
  Future<List<Food>> getFoodData() async {
    final response = await http.get(Uri.parse("http://localhost/get-food"));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Food> foodList =
          jsonResponse.map((food) => Food.fromJson(food)).toList();
      return foodList;
    } else {
      print('Error: ${response.statusCode}');
      return [];
    }
  }
}
