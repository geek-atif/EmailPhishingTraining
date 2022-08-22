import 'package:flutter/material.dart';

class LightTextBody extends StatelessWidget {
  final String data;
  const LightTextBody({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          fontStyle: FontStyle.normal, fontSize: 16, color: Colors.white),
    );
  }
}
