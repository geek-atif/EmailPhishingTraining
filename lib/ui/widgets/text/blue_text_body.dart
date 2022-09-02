import 'package:flutter/material.dart';
import '../../styles/fonts.dart';
import '../../styles/my_app_theme.dart';

class BlueTextBody extends StatelessWidget {
  final String data;
  const BlueTextBody({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: 14,
        color: MyAppTheme.whitehaxButtonColor,
        fontFamily: Fonts.poppins,
      ),
    );
  }
}
