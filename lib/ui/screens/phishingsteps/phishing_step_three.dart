import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ui/widgets/button/dark_blue_button.dart';
import '../../../ui/widgets/text/light_text_body.dart';
import '../../../ui/styles/my_app_theme.dart';
import '../../widgets/dialogs/phishingsteps/phishing_one_dialog.dart';
import '../../widgets/dialogs/phishingsteps/phishing_three_dialog.dart';
import '../../widgets/text/light_text_head.dart';
import '../../widgets/text/light_text_sub_head.dart';

class PhishingStepThree extends StatefulWidget {
  const PhishingStepThree({Key? key}) : super(key: key);

  @override
  State<PhishingStepThree> createState() => _PhishingStepThreeState();
}

class _PhishingStepThreeState extends State<PhishingStepThree>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey<State> keyLoader = GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: LightTextHead(
                    data: "STEP 3",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LightTextBody(data: 'phishingThree'.tr),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const LightTextSubHead(data: "NOTE :"),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(child: LightTextBody(data: "phishingThreeNote".tr))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () =>
                      PhishingThreeDialog.showLoadingDialog(context, keyLoader),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
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
