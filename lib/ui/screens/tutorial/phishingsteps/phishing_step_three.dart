import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/server_update_controller.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../widgets/dialogs/phishingsteps/phishing_four_dialog.dart';
import '../../../widgets/dialogs/phishingsteps/phishing_two_dialog.dart';
import '../../../widgets/text/bullet_light_text_body.dart';
import '../../../widgets/text/bullet_note_light_text_body.dart';
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
  final ServerUpdateController _serverUpdateController =
      Get.put(ServerUpdateController());

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
                  height: 8,
                ),
                const Center(
                  child: LightTextHead(
                    data: "Step-3: Attachment or URL Links",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BulletLightTextBody(
                      data:
                          'Check if email has an attachment (pdf, word or other common formats) OR a URL Link that the email prods you to click.'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BulletLightTextBody(
                      data:
                          'Do not click the URL link or attachment in such emails. If you accidently do, close browser and delete any downloaded files from your device.'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BulletNoteLightTextBody(
                      data:
                          'Unless you initiated or requested something, no legit company will send an email with an attachment or URL Link.'),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => PhishingThreeDialog.showLoadingDialog(
                      context, keyLoader, _serverUpdateController),
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
