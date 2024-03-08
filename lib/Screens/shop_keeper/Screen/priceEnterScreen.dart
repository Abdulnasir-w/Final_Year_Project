import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../Components/customTextForm.dart';
import '../../../Models/Food/foodApi.dart';
import '../../../Models/Food/foodDataHandling.dart';

class PriceEntryScreen extends StatefulWidget {
  const PriceEntryScreen({
    super.key,
    required this.otp,
    required this.onPriceAdd,
  });
  final String otp;
  final void Function() onPriceAdd;

  @override
  State<PriceEntryScreen> createState() => _PriceEntryScreenState();
}

class _PriceEntryScreenState extends State<PriceEntryScreen> {
  final formkey = GlobalKey<FormState>();
  final priceController = TextEditingController();
  List<Food> foodList = [];
  final FoodApi foodApi = FoodApi();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchFoodData();
  }

  void fetchFoodData() async {
    try {
      setState(() {
        isLoading = true;
      });
      List<Food> newFoodList = await foodApi.getFoodData(widget.otp);
      setState(() {
        foodList = newFoodList;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }

  void sendPriceToServer() async {
    final token = await getToken();

    final response = await http.post(
      Uri.parse("https://idrees.blogvali.com/api/rashion/create"),
      headers: {
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'otp': widget.otp,
        'price': priceController.text,
      },
    );
    final data = json.decode(response.body);

    if (response.statusCode == 200 && data['success'] == '200') {
      widget.onPriceAdd();
      Fluttertoast.showToast(msg: 'Food Added Successfully');
    } else {
      Fluttertoast.showToast(msg: "Food Not Added. Try Again!");
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Pricing Screen",
          //style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: formkey,
                child: Column(
                  children: [
                    //buildFoodTable(),
                    // Text('Enter the price for ${widget.data.rashanItem}:'),
                    const SizedBox(height: 16),
                    CustomTextForm(
                      controller: priceController,
                      title: "Enter Price",
                      keyboardType: TextInputType.number,
                      label: "Price",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Price";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        validatePrice(context);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  // Widget buildFoodTable() {
  //   return DataTable(
  //     border: TableBorder.all(
  //       width: 1,
  //       color: Colors.black,
  //       style: BorderStyle.solid,
  //       borderRadius: BorderRadius.circular(5),
  //     ),
  //     // showBottomBorder: true,
  //     dividerThickness: 2,
  //     dataRowColor: MaterialStateColor.resolveWith(
  //         (states) => const Color.fromARGB(255, 221, 238, 182)),
  //     headingRowColor:
  //         MaterialStateColor.resolveWith((states) => const Color(0xffDBB7F2)),
  //     // decoration: BoxDecoration(
  //     //     border: Border.all(
  //     //       color: Colors.black,
  //     //       width: 1,
  //     //     ),
  //     //     borderRadius: BorderRadius.circular(10)),
  //     // headingTextStyle: TextStyle(fontSize: 12),
  //     columnSpacing: 30,
  //     columns: const [
  //       DataColumn(label: Text('ID')),
  //       DataColumn(label: Text('Food Name')),
  //       DataColumn(label: Text('Quantity')),
  //       DataColumn(label: Text('OTP')),
  //     ],
  //     rows: foodList.map((food) {
  //       return DataRow(
  //         cells: [
  //           DataCell(Text(food.id)),
  //           DataCell(Text(food.foodName)),
  //           DataCell(Text(food.quantity)),
  //           DataCell(Text(food.otp)),
  //         ],
  //       );
  //     }).toList(),
  //   );
  // }

  void validatePrice(BuildContext context) {
    // Validate if the price is entered
    if (priceController.text.isNotEmpty) {
      sendPriceToServer();

      // Optionally, you can navigate back to the previous screen
      Navigator.pop(context);
    } else {
      // Show an error message if the price is not entered
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please enter a valid price.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
