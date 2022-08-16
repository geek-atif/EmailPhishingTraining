import 'package:flutter/material.dart';
import '../../styles/fonts.dart';
import '../../styles/my_app_theme.dart';

class DarkTextBody extends StatelessWidget {
  final String data;
  const DarkTextBody({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        data,
        style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 15,
        ),
      ),
    );
  }
}
