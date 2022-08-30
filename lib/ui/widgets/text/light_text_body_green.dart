import 'package:flutter/material.dart';
import '../../styles/fonts.dart';

class LightTextBodyGreen extends StatelessWidget {
  final String data;
  const LightTextBodyGreen({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: Colors.green,
          fontFamily: Fonts.poppins,
          fontWeight: FontWeight.w700),
    );
  }
}
