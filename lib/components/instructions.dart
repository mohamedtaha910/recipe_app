import 'package:flutter/material.dart';
import 'package:recipe_app/constant.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key, required this.instructions});
  final String instructions;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          instructions,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            height: 1.8,
            color: kSecondaryColor
          ),
        ),
      ),
    );
  }
}
