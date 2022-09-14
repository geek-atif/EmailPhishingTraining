import '../../../../ui/widgets/text/bullet_light_text_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/server_update_controller.dart';
import '../../../styles/fonts.dart';
import '../../../widgets/dialogs/office365/office_four_dialog.dart';
import '../../../widgets/dialogs/office365/office_one_dialog.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_sub_head.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/text/light_text_head.dart';

class OfficePhishingFiveScreen extends StatefulWidget {
  const OfficePhishingFiveScreen({Key? key}) : super(key: key);

  @override
  State<OfficePhishingFiveScreen> createState() =>
      _OfficePhishingFiveScreenState();
}

class _OfficePhishingFiveScreenState extends State<OfficePhishingFiveScreen>
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
                    data: "Best Practice",
                  ),
                ),
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
                Obx(
                  () => _serverUpdateController.isLoading.value
                      ? const Loading(
                          loadingMessage: '',
                        )
                      : InkWell(
                          onTap: () =>
                              _serverUpdateController.updateTutorial("365Doc"),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: DarkBlueButton(buttonText: "Done"),
                          ),
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
