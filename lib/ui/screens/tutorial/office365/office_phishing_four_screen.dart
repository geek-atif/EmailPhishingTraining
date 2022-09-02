import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
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
                    data: "Shared documents scams",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LightTextBody(
                  data: "sharepointOne".tr,
                ),
                LightTextBody(
                  data: "sharepointTwo".tr,
                ),
                LightTextBody(
                  data: "sharepointThree".tr,
                ),
                LightTextBody(
                  data: "sharepointFour".tr,
                ),
                LightTextBody(
                  data: "sharepointFive".tr,
                ),
                LightTextBody(
                  data: "sharepointSix".tr,
                ),
                LightTextBody(
                  data: "sharepointSeven".tr,
                ),
                const SizedBox(
                  height: 15,
                ),
                LightTextSubHead(data: "Best Practice"),
                LightTextBody(
                  data:
                      "Do not click the URL link or attachment in any email before verifying the sender and URL Link. If the sender appears legit but you do not know of any documents that are supposed to be shared with you, do not open the attachment until you verify the identity of the sender. If you accidently do click the link, close your browser and delete any downloaded files from your device.",
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () =>
                      OfficeFourDialog.showLoadingDialog(context, keyLoader),
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
