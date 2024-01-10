import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final String title;
  final TextInputType? keyboardType;
  final String? label;
  final IconData? prefixIcon;
  final bool isPassField;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextForm({
    super.key,
    required this.title,
    this.label,
    this.keyboardType,
    this.isPassField = false,
    this.validator,
    this.prefixIcon,
    this.maxLines,
    this.controller,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassField ? isVisible : false,
      controller: widget.controller,
      maxLines: widget.isPassField ? 1 : widget.maxLines,
      cursorColor: Colors.black,
      //style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: widget.title,
        filled: true,
        fillColor: Colors.white70,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: Colors.black,
              )
            : null,
        suffixIcon: widget.isPassField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                style: ButtonStyle(
                  //backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red),
                  foregroundColor:
                      MaterialStateProperty.resolveWith((states) => Colors.red),
                  // overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                ),
                icon: Icon(
                  isVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.black,
                ))
            : null,
      ),
      validator: widget.validator,
    );
  }
}
