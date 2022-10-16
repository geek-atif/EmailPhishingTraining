import '../../../../ui/routers/my_router.dart';
import 'package:get/get.dart';

import '../../../../ui/widgets/button/dark_blue_button.dart';
import '../../../../ui/widgets/text/light_text_body.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../../../ui/styles/my_app_theme.dart';
import '../../../../ui/widgets/text/light_text_head.dart';
import 'package:flutter/material.dart';

import '../../../styles/images.dart';
import '../../../widgets/my_app_bar.dart';

class PhishingFactsFirstScreen extends StatelessWidget {
  const PhishingFactsFirstScreen({super.key});

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
                          "1. Phishing is the fraudulent practice of sending emails masquerading reputable companies or person in order to induce you to reveal personal information, such as passwords and credit card numbers or download malicious software"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "2.Email phishing is the most widely used cyber-attack technique"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "3. Phishing emails often contain the subject line trying to convey urgency, importance and attention such as “you have won”, “account expired”, “credit card declined”, “your UPS/Fedex order #”, “password change notification” etc."),
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
                          child: Image.asset(Images.fact1)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "4. Another give away of phishing is the email body which contain poor grammatically structured sentences, spelling mistakes etc."),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "5. Often times phishing email comes from foreign countries whose domain names end in a 2 letters of the country following the dot such .fr for France, .ru for Russia, .ca for Canada, .au for Australia etc"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "6. Phishing emails typically contain a malicious URL or attachment enticing you to click the link or open the attachment"),
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
                          child: Image.asset(Images.fact2)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "7. A common characteristic of malicious emails is either having an attachment (pdf, word doc or other common formats) OR a URL Link that the email prods you to click"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "8. Know that unless you initiated or requested something back, no legit company will send you an email with an attachment or URL Link for you to click"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "9. Spear Phishing is when malicious emails is sent to a specific person or a specific group of employees of a company."),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.phishingFactsSecondScreen),
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
