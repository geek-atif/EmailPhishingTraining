import '../../../../ui/widgets/text/light_text_sub_head.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routers/my_router.dart';
import '../../../styles/my_app_theme.dart';
import '../../button/dark_blue_button.dart';
import '../../text/light_text_body_sub.dart';
import '../../text/light_text_head.dart';

class PhishingMainDialog {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => true,
            child: SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              key: key,
              //backgroundColor: Colors.transparent,
              backgroundColor: MyAppTheme.whitehaxdialog,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Center(
                    child: LightTextSubHead(
                      data:
                          "In 3 easy-steps learn to detect and stop email phishing.",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: LightTextSub(
                      data:
                          "This tutorial explains how to detect emails containing ransomware, viruses and other malware, in three easy steps."),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Start"),
                  ),
                )
              ],
            ),
          );
        });
  }
}
