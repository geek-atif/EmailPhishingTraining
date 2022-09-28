import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String buttonText;

  RedButton({
    required this.buttonText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFff0000),
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
