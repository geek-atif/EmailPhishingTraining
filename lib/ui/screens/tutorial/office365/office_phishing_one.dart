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

class OfficePhishingOne extends StatefulWidget {
  const OfficePhishingOne({Key? key}) : super(key: key);

  @override
  State<OfficePhishingOne> createState() => _OfficePhishingOneState();
}

class _OfficePhishingOneState extends State<OfficePhishingOne>
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
                Center(
                  child: LightTextHead(
                    data: "theattackchain".tr,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LightTextBody(
                  data: "theattackchainSubOne".tr,
                ),
                LightTextBody(
                  data: "theattackchainSubTwo".tr,
                ),
                LightTextBody(
                  data: "theattackchainSubThree".tr,
                ),
                LightTextBody(
                  data: "theattackchainSubFour".tr,
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () =>
                      OfficeOneDialog.showLoadingDialog(context, keyLoader),
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
