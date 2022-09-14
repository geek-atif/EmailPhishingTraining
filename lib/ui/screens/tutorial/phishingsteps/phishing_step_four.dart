import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/server_update_controller.dart';
import '../../../../utiles/constant.dart';
import '../../../../utiles/utility.dart';
import '../../../routers/my_router.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/text/bullet_light_text_body.dart';
import '../../../widgets/text/bullet_note_light_text_body.dart';
import '../../../widgets/text/light_text_body.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/dialogs/phishingsteps/phishing_three_dialog.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_head.dart';
import '../../../widgets/text/light_text_sub_head.dart';

class PhishingStepFour extends StatefulWidget {
  const PhishingStepFour({Key? key}) : super(key: key);

  @override
  State<PhishingStepFour> createState() => _PhishingStepFourState();
}

class _PhishingStepFourState extends State<PhishingStepFour>
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
                    data: "RECAP :",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "1. If an email subject line conveys urgency, importance or attention and has a URL or attachment – be careful. It might be a phishing email"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data:
                          "2. If email seems suspicious, check sender’s email address"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LightTextBody(
                      data: "3. Always check URL link, if the domain contains"),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: LightTextBody(data: "a) https at the start;"),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: LightTextBody(
                      data:
                          "b) matches the sender company domain (if it’s from a 3 rd party) and"),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: LightTextBody(
                      data:
                          "c) does not have excess characters before or after company name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => _serverUpdateController.isLoading.value
                      ? const Loading(
                          loadingMessage: '',
                        )
                      : InkWell(
                          onTap: () {
                            Utility.saveBolValue(
                                TUTORIAL_STEP_ATTEMPT_Done, true);
                            _serverUpdateController.updateTutorial("3StepsDoc");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: DarkBlueButton(buttonText: "Done"),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () => Get.toNamed(
                    MyRouter.phishingStepOne,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Start Again !"),
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
