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

class SmishingStepThree extends StatelessWidget {
  const SmishingStepThree({super.key});

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
                    data: "5 Ways to Prevent SMiShing Attacks",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(Images.smishing3),
                const SizedBox(
                  height: 20,
                ),
                const LightTextBody(
                    data:
                        "1. Always check your message's sender – do you recognize the contact?\n\n\n2. Remember that legitimate companies will not ask for personal information over text\n\n\n3. Never click on hyperlinks that may appear in the message, or offer up sensitive information\n\n\n4. If you are directed to a website, ensure that web filters are alerting you to potentially malicious content\n\n\n5. Understand that smishing is not limited to texting – WhatsApp, Facebook, and Skype messengers are all potentially vulnerable"),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.smishingStepOne),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Recape"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Get.offAndToNamed(MyRouter.homeScreen),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Home"),
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
