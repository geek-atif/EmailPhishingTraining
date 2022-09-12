import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../widgets/text/bullet_light_text_body.dart';
import '../../../widgets/text/bullet_note_light_text_body.dart';
import '../../../widgets/text/light_text_body.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/dialogs/phishingsteps/phishing_one_dialog.dart';
import '../../../widgets/dialogs/phishingsteps/phishing_three_dialog.dart';
import '../../../widgets/dialogs/phishingsteps/phishing_two_dialog.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_head.dart';
import '../../../widgets/text/light_text_sub_head.dart';

class PhishingStepTwo extends StatefulWidget {
  const PhishingStepTwo({Key? key}) : super(key: key);

  @override
  State<PhishingStepTwo> createState() => _PhishingStepTwoState();
}

class _PhishingStepTwoState extends State<PhishingStepTwo>
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
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                const Center(
                  child: LightTextHead(
                    data: "Step-2: Sender’s Email Address",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BulletLightTextBody(
                      data:
                          'If Subject looks suspicious, check the Sender’s email address.'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BulletLightTextBody(
                      data:
                          'Click on the Sender’s emails or hover over it to see full sender’s email. Likely, the email address will not match domain name that reflects the email’s subject or message.'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BulletNoteLightTextBody(
                      data: 'No legit email will have unrecognizable domain.'),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () =>
                      PhishingTwoDialog.showLoadingDialog(context, keyLoader),
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
