import 'package:flutter/material.dart';
import '../../../ui/styles/my_app_theme.dart';

import '../../styles/fonts.dart';

class LightTextBodyRed extends StatelessWidget {
  final String data;
  const LightTextBodyRed({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: MyAppTheme.errorRed,
          fontFamily: Fonts.poppins,
          fontWeight: FontWeight.w700),
    );
  }
}
