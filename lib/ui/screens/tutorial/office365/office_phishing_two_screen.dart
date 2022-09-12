import 'package:PhishSim/ui/widgets/text/bullet_light_text_body.dart';

import '../../../../ui/widgets/dialogs/office365/office_two_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../styles/fonts.dart';
import '../../../widgets/dialogs/office365/office_one_dialog.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_sub_head.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/dialogs/my_dialogs.dart';
import '../../../widgets/text/light_text_body.dart';
import '../../../widgets/text/light_text_head.dart';

class OfficePhishingTwoScreen extends StatefulWidget {
  const OfficePhishingTwoScreen({Key? key}) : super(key: key);

  @override
  State<OfficePhishingTwoScreen> createState() =>
      _OfficePhishingTwoScreenState();
}

class _OfficePhishingTwoScreenState extends State<OfficePhishingTwoScreen>
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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(),
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: LightTextHead(
                    data: "2. Subject contains : Non-delivered Emails",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: BulletLightTextBody(
                    data:
                        "Subject line that says “Your messages have not been delivered” or “Last email message was not delivered”",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: BulletLightTextBody(
                    data:
                        "Email body would indicate “Microsoft Office found several undelivered messages”. Body contains “Send Again”, “Resend Message” or such other button",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: BulletLightTextBody(
                    data: "Steps to detect Scam",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 5),
                  child: LightTextBody(
                    data:
                        "i. Check the Sender’s Email address for “microsoft.com” at the end",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 10),
                  child: LightTextBody(
                    data:
                        "ii. Check the button URL in the email for “microsoft.com” at the end",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () =>
                      OfficeTwoDialog.showLoadingDialog(context, keyLoader),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
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
