import '../../../../ui/widgets/text/light_text_body.dart';
import '../../../../ui/widgets/text/light_text_sub_head.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routers/my_router.dart';
import '../../../styles/images.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_head.dart';

class SmishingStepTwo extends StatelessWidget {
  const SmishingStepTwo({super.key});

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
                    data: "Targeted Mobile Malware",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(Images.smishing2),
                const SizedBox(
                  height: 20,
                ),
                const LightTextSubHead(
                  data: "How Smishing Works",
                ),
                const LightTextBody(
                    data:
                        "Smishing has gained traction for a number of reasons. Unlike your inbox, incoming text messages on mobile devices are not subjected to traditional spam filters and authentication systems.\n\nWithout this initial line of defense, malicious text messages can easily slip into your mobile phone. This effect is compounded by the fact that text messages often reflect a mix of business and personal correspondence. The familiar, often varied, threads in one's inbox can obscure otherwise suspicious information.\n\nIn 2020, smishing attacks increased 328%. Legitimate authorities used SMS messages to communicate about Covid-19 related contact tracing, vaccine options, lockdowns, etc.\n\nThis prompted a wave of cybercriminals to replicate pandemic-related content and extort victims. A recent report found that 44% of Americans had seen an increase in scam calls and text messages since the start of 2020. Smishing is now the most common mobile-based phishing, followed by social media, email, and gaming-based attacks."),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.smishingStepThree),
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
