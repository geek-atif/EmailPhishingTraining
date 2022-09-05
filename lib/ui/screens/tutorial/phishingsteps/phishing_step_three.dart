import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../widgets/text/light_text_body.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/dialogs/phishingsteps/phishing_three_dialog.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_head.dart';
import '../../../widgets/text/light_text_sub_head.dart';

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
        appBar: const MyAppBar(),
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: LightTextHead(
                    data: "Step 3 : Attachments or URL links in the email body",
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
                const LightTextSubHead(data: "NOTE :"),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LightTextBody(data: "phishingThreeNote".tr),
                ),
                const SizedBox(
                  height: 5,
                ),
                const LightTextSubHead(data: "RECAP :"),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "1. If an email subject line conveys urgency, importance or attention and it has a URL link or attachment – be careful. It might be a phishing email"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "2. If email seems suspicious, check sender’s email address by clicking or hovering over it"),
                ),
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "3. Always check URL link by hovering over it to see if the domain contains"),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 10),
                  child: LightTextBody(data: "a) https at the start;"),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 10),
                  child: LightTextBody(
                      data:
                          "b) matches the sender company domain (if it’s from a 3 rd party) and"),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 10),
                  child: LightTextBody(
                      data:
                          "c) does not have excess characters before or after company name"),
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
