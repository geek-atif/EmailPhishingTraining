import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../widgets/dialogs/office365/office_one_dialog.dart';
import '../../../widgets/dialogs/office365/office_three_dialog.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_sub_head.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/dialogs/my_dialogs.dart';
import '../../../widgets/text/light_text_body.dart';
import '../../../widgets/text/light_text_head.dart';

class OfficePhishingThreeScreen extends StatefulWidget {
  const OfficePhishingThreeScreen({Key? key}) : super(key: key);

  @override
  State<OfficePhishingThreeScreen> createState() =>
      _OfficePhishingThreeScreenState();
}

class _OfficePhishingThreeScreenState extends State<OfficePhishingThreeScreen>
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
                  height: 10,
                ),
                const Center(
                  child: LightTextHead(
                    data: "3. SharePoint Phishing Scams",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data: "office365One".tr,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data: "office365Two".tr,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data: "office365Three".tr,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () =>
                      OfficeThreeDialog.showLoadingDialog(context, keyLoader),
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
