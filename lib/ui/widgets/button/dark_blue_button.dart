import 'package:flutter/material.dart';
import '../../styles/my_app_theme.dart';
import '../../styles/fonts.dart';

class DarkBlueButton extends StatelessWidget {
  final String buttonText;

  DarkBlueButton({
    required this.buttonText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyAppTheme.primaryColor,
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
