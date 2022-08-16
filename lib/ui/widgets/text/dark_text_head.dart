import 'package:flutter/material.dart';
import '../../styles/fonts.dart';
import '../../styles/my_app_theme.dart';

class DarkTextHead extends StatelessWidget {
  final String data;
  const DarkTextHead({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        data,
        style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: MyAppTheme.blackColor,
            fontFamily: Fonts.poppins,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
