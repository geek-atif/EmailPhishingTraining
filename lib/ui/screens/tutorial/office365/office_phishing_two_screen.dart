import 'package:PhishSim/ui/widgets/dialogs/office365/office_two_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
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
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: LightTextHead(
                    data: "Non-delivered Emails",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LightTextBody(
                  data: "nondeliveredEmailsOne".tr,
                ),
                LightTextBody(
                  data: "nondeliveredEmailsTwo".tr,
                ),
                LightTextBody(
                  data: "nondeliveredEmailsThree".tr,
                ),
                LightTextBody(
                  data: "nondeliveredEmailsFour".tr,
                ),
                LightTextBody(
                  data: "nondeliveredEmailsFive".tr,
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
