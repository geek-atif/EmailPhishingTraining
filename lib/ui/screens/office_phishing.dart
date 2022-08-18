import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:threattraining/ui/widgets/button/dark_blue_button.dart';

import '../../ui/widgets/text/dark_text_head_main.dart';
import '../../ui/widgets/text/light_text_body.dart';
import '../../ui/styles/my_app_theme.dart';
import '../../ui/widgets/text/dark_text_head.dart';
import '../widgets/my_dialogs.dart';

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
        backgroundColor: MyAppTheme.grey100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: DarkTextHeadMain(
                    data: "theattackchain".tr,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DarkTextBody(
                  data: "theattackchainOne".tr,
                ),
                const SizedBox(
                  height: 30,
                ),
                DarkTextHead(
                  data: "theattackchainTwo".tr,
                ),
                const SizedBox(
                  height: 5,
                ),
                DarkTextBody(
                  data: "theattackchainSubOne".tr,
                ),
                DarkTextBody(
                  data: "theattackchainSubTwo".tr,
                ),
                DarkTextBody(
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
