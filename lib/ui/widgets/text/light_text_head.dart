import '../../styles/fonts.dart';
import 'package:flutter/material.dart';

class LightTextHead extends StatelessWidget {
  final String data;
  const LightTextHead({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 22,
          color: Colors.white,
          fontFamily: Fonts.poppins,
          fontWeight: FontWeight.w600),
    );
  }
}
