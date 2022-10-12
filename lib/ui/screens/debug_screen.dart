import 'dart:async';
import '../../../ui/styles/my_app_theme.dart';
import '../../ui/widgets/button/dark_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utiles/utility.dart';
import '../native_code/platform_channel_handler.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  final _platformChannelHandler = PlatformChannelHandler();
  getTotp() async {
    var totp = "";
    try {
      totp = await _platformChannelHandler.getTotp();
      //totp = Utility.getTotp();
    } on PlatformException catch (e) {
      Get.snackbar("Error", e.message.toString());
    }
    Utility.showInfo(totp.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyAppTheme.whitehaxBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => getTotp(),
              child: DarkBlueButton(buttonText: "Get TOTP"),
            ),
          ),
        ],
      ),
    ));
  }
}
