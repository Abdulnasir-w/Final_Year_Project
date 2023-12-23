import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({super.key});

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String selectedValue = '1';
  List<String> options = ['1', '2', '3', '4', '5', '6', '7'];
  @override
  Widget build(BuildContext context) {
    assert(options.toSet().length == options.length,
        'Duplicate values found in options list');
    return DropdownButton(
      //isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      borderRadius: BorderRadius.circular(12),
      items: options.map((String option) {
        return DropdownMenuItem(value: option, child: Text(option));
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue ?? ''; // Handle null case
        });
      },
      value: selectedValue, // Set the selected value
    );
  }
}
