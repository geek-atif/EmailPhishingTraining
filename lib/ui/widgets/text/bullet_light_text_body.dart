import 'package:flutter/material.dart';

import '../../styles/fonts.dart';

class BulletLightTextBody extends StatelessWidget {
  const BulletLightTextBody({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          const TextSpan(
            text: "\u2022",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                fontFamily: Fonts.poppins,
                fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: " ${data}",
            style: const TextStyle(
                fontStyle: FontStyle.normal, fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
