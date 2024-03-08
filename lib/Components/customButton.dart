import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 180,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 27, 29, 29),
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              // fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
