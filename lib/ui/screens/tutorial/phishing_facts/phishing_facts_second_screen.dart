import 'package:PhishSim/ui/routers/my_router.dart';
import 'package:get/get.dart';

import '../../../../ui/widgets/button/dark_blue_button.dart';
import '../../../../ui/widgets/text/light_text_body.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../../../ui/styles/my_app_theme.dart';
import '../../../../ui/widgets/text/light_text_head.dart';
import 'package:flutter/material.dart';

import '../../../styles/images.dart';
import '../../../widgets/my_app_bar.dart';

class PhishingFactsSecondScreen extends StatelessWidget {
  const PhishingFactsSecondScreen({super.key});

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
                  child: LightTextHead(data: "Phishing Facts and Information"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "10. In Spear Phishing the attacker uses knowledge of personal information such as full name, company you work for, people you know, your job title, your company email etc. to send phishing email"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "11. Spear Phishing is more convincing than regular scam emails due to personal nature of it enticing you to open and click URL or attachment"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "12. Whaling is a form of phishing email scam targeting senior executives of a company"),
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
                          child: Image.asset(Images.fact3)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "13. Phishing emails purporting to come from your company CEO, other executives or your manager are a type of Whaling scams"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "14. Smishing is a type of phishing scam which uses SMS or text messages instead of emails"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "15. Common types of text messages in smishing scam purport to come from a Bank, a large retailer, a delivery carrier, a political party asking for donation and others"),
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
                          child: Image.asset(Images.fact4)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "16. Know that no legit company or government agency sends emails to solicit account, password, SSN, credit card or any other personal information."),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "17. Know that legit sender email id will always have recognizable domain"),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.phishingFactsThreeScreen),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DarkBlueButton(buttonText: "Next"),
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
