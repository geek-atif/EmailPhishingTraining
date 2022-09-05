import 'package:PhishSim/ui/widgets/text/light_text_sub_head.dart';
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
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Center(
                    child: LightTextSubHead(
                      data:
                          "Learn steps to detect and stop Office 365 phishing",
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
                          "Cloud-based email hosting services like Microsoft Office 365 makes accessing one’s emails much simpler. Users can go directly to the Office 365 web page, enter their company credentials and log right into their email accounts from anywhere they like. This simplicity of a single login-step however makes it easier for Phishing scammers and hackers to obtain login credentials by simply faking the Microsoft office login page. The methods used by attackers to gain access to an Office 365 account are fairly straightforward. The phishing campaigns usually take the form of an email from Microsoft with a URL link which appears to point to Microsoft Office 365 or SharePoint login page. This tutorial explains how to detect some of the most common Office 365 phishing scams and how to detect them in few easy steps. Here are some of the most common Office 365 email scams"),
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
