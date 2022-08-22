import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LightTextBodyAutoSize extends StatelessWidget {
  final String data;
  const LightTextBodyAutoSize({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      data,
      style: const TextStyle(
          fontStyle: FontStyle.normal, fontSize: 14, color: Colors.white),
      maxLines: 2,
    );
  }
}
