import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String buttonText;

  GreenButton({
    required this.buttonText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF008000),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
