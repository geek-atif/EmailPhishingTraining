import '../../../../ui/routers/my_router.dart';
import 'package:PhishSim/utiles/utility.dart';
import 'package:get/get.dart';
import '../../../../ui/widgets/button/dark_blue_button.dart';
import '../../../../ui/widgets/text/light_text_body.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import '../../../../ui/styles/my_app_theme.dart';
import '../../../../ui/widgets/text/light_text_head.dart';
import 'package:flutter/material.dart';
import '../../../../utiles/constant.dart';
import '../../../styles/images.dart';
import '../../../widgets/my_app_bar.dart';

class PhishingFactsThreeScreen extends StatelessWidget {
  const PhishingFactsThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(),
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextHead(data: "Detecting Phishing Scams"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "1. Do not click the URL link or attachment in a suspicious email"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "2. Checking the sender’s email address is quickest way to verify if it’s a legit email or phishing scam"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "3. Click on the Sender’s emails once or on some devices, twice and a pop-up will show the details of the sender’s email. Invariably, the email address will not have domain name that reflects the email’s subject or message"),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ZoomOverlay(
                      minScale: 0.5, // Optional
                      maxScale: 3.0, // Optional
                      twoTouchOnly: true, // Defaults to false
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(Images.fact5)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "4. If you do not recognize the domain name of the sender’s email address, do not click any URL links or open attachments from that email"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "5. If by mistake you click a URL link in a malicious email, immediately close the browser"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "6. Do not enter any personal information in a web page that does not have a green lock symbol on it or the URL that starts with https://"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "7. Do not enter any personal information in web page whose domain name you do not recognize"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "8. If by mistake you download a file from an unknown website, delete the file and reboot your system immediately."),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.offAndToNamed(MyRouter.homeScreen);
                    Utility.saveBolValue(TUTORIAL_PHISHING_FACT_Done, true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DarkBlueButton(buttonText: "Done"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
