import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../styles/my_app_theme.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyAppTheme.whitehaxBackgroundColor,
      actions: [
        InkWell(
          onTap: () {
            Get.offAndToNamed("/");
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp]);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.exit_to_app_rounded),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
