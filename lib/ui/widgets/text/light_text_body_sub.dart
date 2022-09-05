import 'package:flutter/material.dart';

class LightTextSub extends StatelessWidget {
  final String data;
  const LightTextSub({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          fontStyle: FontStyle.normal, fontSize: 14, color: Colors.white),
    );
  }
}
