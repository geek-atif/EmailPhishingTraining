import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../ui/widgets/text/light_text_sub_head.dart';
import '../../ui/widgets/button/dark_blue_button.dart';
import '../../ui/styles/my_app_theme.dart';
import '../widgets/dialogs/my_dialogs.dart';
import '../widgets/text/light_text_body.dart';
import '../widgets/text/light_text_head.dart';

class OfficePhishing extends StatefulWidget {
  const OfficePhishing({Key? key}) : super(key: key);

  @override
  State<OfficePhishing> createState() => _OfficePhishingState();
}

class _OfficePhishingState extends State<OfficePhishing>
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
                  height: 15,
                ),
                LightTextBody(
                  data: "theattackchainOne".tr,
                ),
                const SizedBox(
                  height: 30,
                ),
                LightTextSubHead(
                  data: "theattackchainTwo".tr,
                ),
                const SizedBox(
                  height: 5,
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
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => Dialogs.showLoadingDialog(context, keyLoader),
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
