import 'package:flutter/material.dart';
import 'package:orphankor/Components/textform_email.dart';
import 'package:orphankor/Models/Food/food_api.dart';
import 'package:orphankor/Models/Food/food_data_handling.dart';
import 'package:orphankor/Models/ShopKeeper/Row%20Data/holdin_row_data_modle.dart';

class PriceEntryScreen extends StatefulWidget {
  //final WidowData data;
  const PriceEntryScreen({
    super.key,
    //required this.data,
  });

  @override
  State<PriceEntryScreen> createState() => _PriceEntryScreenState();
}

class _PriceEntryScreenState extends State<PriceEntryScreen> {
  final formkey = GlobalKey<FormState>();
  final priceController = TextEditingController();
  List<Food> foodList = [];
  final FoodApi foodApi = FoodApi();

  @override
  void initState() {
    super.initState();
    fetchFoodData();
  }

  void fetchFoodData() async {
    try {
      List<Food> newFoodList = await foodApi.getFoodData();
      setState(() {
        foodList = newFoodList;
      });
    } catch (e) {
      print('Error fetching food data: $e');
      // Handle the error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Pricing Screen",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              buildFoodTable(),
              // Text('Enter the price for ${widget.data.rashanItem}:'),
              const SizedBox(height: 16),
              CustomTextForm(
                controller: priceController,
                title: "Enter Price",
                keyboardType: TextInputType.number,
                label: "Price",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  savePrice(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFoodTable() {
    return DataTable(
      border: TableBorder.all(
        width: 1,
        color: Colors.black,
        style: BorderStyle.solid,
        borderRadius: BorderRadius.circular(12),
      ),
      showBottomBorder: true,
      dividerThickness: 2,
      dataRowColor: MaterialStateColor.resolveWith(
          (states) => const Color.fromARGB(255, 221, 238, 182)),
      headingRowColor:
          MaterialStateColor.resolveWith((states) => const Color(0xffDBB7F2)),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10)),
      columns: const [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Food Name')),
        DataColumn(label: Text('Quantity')),
      ],
      rows: foodList.map((food) {
        return DataRow(
          cells: [
            DataCell(Text(food.id.toString())),
            DataCell(Text(food.foodName)),
            DataCell(Text(food.quantity.toString())),
          ],
        );
      }).toList(),
    );
  }

  void savePrice(BuildContext context) {
    // Validate if the price is entered
    if (priceController.text.isNotEmpty) {
      // Convert the entered price to a numeric value (double)
      double enteredPrice = double.tryParse(priceController.text) ?? 0.0;

      // TODO: Add your logic to save the price (use 'enteredPrice')
      // For now, simply print the entered price
      print('Price saved: $enteredPrice');

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
