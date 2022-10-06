import '../../styles/fonts.dart';
import 'package:flutter/material.dart';

class LightTextSubEighHead extends StatelessWidget {
  final String data;
  const LightTextSubEighHead({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 18,
          color: Colors.white,
          fontFamily: Fonts.poppins,
          fontWeight: FontWeight.w400),
    );
  }
}
