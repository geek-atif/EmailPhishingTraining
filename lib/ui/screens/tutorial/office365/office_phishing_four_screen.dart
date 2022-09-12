import 'package:PhishSim/ui/widgets/text/bullet_light_text_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../controller/server_update_controller.dart';
import '../../../styles/fonts.dart';
import '../../../widgets/dialogs/office365/office_four_dialog.dart';
import '../../../widgets/dialogs/office365/office_one_dialog.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_sub_head.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/dialogs/my_dialogs.dart';
import '../../../widgets/text/light_text_body.dart';
import '../../../widgets/text/light_text_head.dart';

class OfficePhishingFourScreen extends StatefulWidget {
  const OfficePhishingFourScreen({Key? key}) : super(key: key);

  @override
  State<OfficePhishingFourScreen> createState() =>
      _OfficePhishingFourScreenState();
}

class _OfficePhishingFourScreenState extends State<OfficePhishingFourScreen>
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
                    data: "4. Shared documents scams",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: BulletLightTextBody(
                    data:
                        "Email sender is either Microsoft Office365 or Microsoft SharePoint with a subject line that someone “has shared a file or document with you”.",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: BulletLightTextBody(
                    data:
                        "Email body will have SharePoint link or a pdf of a document",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: BulletLightTextBody(
                    data:
                        "The shared document link may look like a Microsoft OneDrive shared document",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: BulletLightTextBody(
                    data: "Steps to detect Scam",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: BulletLightTextBody(
                    data:
                        "Check the sender’s email address. However, unlike the other scams, the email may come from a compromised company account or a known sender account. Therefore, do not click link or doc",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 5),
                  child: BulletLightTextBody(
                    data:
                        "Check the Login Link or Shared Document button URL to end in “microsoft.com” or “onedrive.com”",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 5),
                  child: BulletLightTextBody(
                    data:
                        "If there is doc attached, the sender email address looks legit but you are not expecting a shared document from that sender, contact the sender directly first to verify. Only open such after confirmation.",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const LightTextSubHead(data: "Best Practice"),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 5),
                  child: BulletLightTextBody(
                    data:
                        "Do not click the URL link or attachment in any email before verifying the sender address and URL Link.",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 2),
                  child: BulletLightTextBody(
                    data: "Verify with the sender if a document is shared.",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 2),
                  child: BulletLightTextBody(
                    data:
                        "If you accidently do click the link, close the browser and delete any downloaded files from your device.",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => OfficeFourDialog.showLoadingDialog(
                      context, keyLoader, _serverUpdateController),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Done"),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
