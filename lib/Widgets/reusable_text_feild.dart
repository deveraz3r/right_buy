import 'package:flutter/material.dart';

class ReusableTextFeild extends StatelessWidget {
  ReusableTextFeild({super.key, required this.hintText, this.controller});

  final String hintText;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1)
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );
  }
}
