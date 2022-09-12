import '../../../../ui/widgets/text/light_text_sub_head.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routers/my_router.dart';
import '../../../styles/my_app_theme.dart';
import '../../button/dark_blue_button.dart';
import '../../text/light_text_body_sub.dart';
import '../../text/light_text_head.dart';

class OfficeMainDialog {
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
                // const Padding(
                //   padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                //   child: Center(
                //     child: LightTextSubHead(
                //       data:
                //           "Learn steps to detect and stop Office 365 phishing",
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: LightTextSub(
                      data:
                          "Learn the most common Office365 phishing scams and how to detect them in few easy steps."),
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
