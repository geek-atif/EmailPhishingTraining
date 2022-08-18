import 'package:flutter/material.dart';
import '../../styles/fonts.dart';
import '../../styles/my_app_theme.dart';

class DarkTextHeadMain extends StatelessWidget {
  final String data;
  const DarkTextHeadMain({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        data,
        style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 22,
            color: MyAppTheme.primaryColor,
            fontFamily: Fonts.poppins,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
