import 'package:PhishSim/ui/widgets/text/light_text_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../ui/routers/my_router.dart';

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
            Get.offAndToNamed(MyRouter.homeScreen);
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp]);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.exit_to_app),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
