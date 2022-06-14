import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.icon,
  });

  final TextEditingController controller;
  final String text;
  final IconData icon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: widget.text,
          hintStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
