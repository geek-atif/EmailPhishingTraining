import 'package:PhishSim/ui/widgets/text/light_text_body.dart';
import 'package:PhishSim/ui/widgets/text/light_text_sub_head.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routers/my_router.dart';
import '../../../styles/images.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_head.dart';

class SmishingStepOne extends StatelessWidget {
  const SmishingStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(),
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                const Center(
                  child: LightTextSubHead(
                    data:
                        "Learn SMS Phishing (Smishing) and how to detect them in few easy steps.",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const LightTextSubHead(
                  data: "What is Smishing?",
                ),
                const LightTextBody(
                    data:
                        "Smishing, or SMS phishing, is the act of committing text message fraud to try to lure victims into revealing account information or installing malware\n\n Similar to phishing, cybercriminals use smishing, the fraudulent attempt to steal credit card details or other sensitive information, by disguising as a trustworthy organization or reputable person in a text message."),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(Images.smishingone),
                const SizedBox(
                  height: 20,
                ),
                const LightTextSubHead(
                  data: "How Smishing Works",
                ),
                const LightTextBody(
                    data:
                        "Smishing uses social-engineering techniques to lure text message recipients into revealing personal or financial information. For example, during the holidays, you get a text message pretending to be from a well-known retailer telling you to go to verify your billing information or your package won’t be shipped in time to make it your gift recipient.\n\nThe only problem is that the fake text message is providing you with a fake website link, where the information you provide will be used to commit identity theft, fraud and other crimes. Smishing is also used to distribute malware and spyware though links or attachments that can steal information and perform other malicious tasks. Messages typically contain some kind of urgency, threat or warning to try to get the recipient to take immediate action."),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.smishingStepTwo),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Next"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
