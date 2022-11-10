import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/server_update_controller.dart';
import '../../../ui/widgets/button/dark_blue_button.dart';
import '../../../ui/widgets/text/light_text_head.dart';
import '../../../../ui/styles/my_app_theme.dart';
import '../../routers/my_router.dart';
import '../../widgets/loading.dart';

class GameScoreScreen extends StatefulWidget {
  @override
  State<GameScoreScreen> createState() => _GameScoreScreenState();
}

class _GameScoreScreenState extends State<GameScoreScreen> {
  late var data;
  final ServerUpdateController _serverUpdateController =
      Get.put(ServerUpdateController());
  @override
  void initState() {
    data = Get.arguments as Map;
    super.initState();
  }

  onClick() {
    _serverUpdateController.updateGame(data["gameName"], data['Ans']);
    // if (data["quizName"] == "quiz1") {
    //   _serverUpdateController.updateGame(data["quizName"], data['Ans']);
    // } else {
    //   Get.offAndToNamed(MyRouter.homeScreen);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.1,
              ),
              const LightTextHead(data: "Total Score "),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              LightTextHead(data: "${data['Ans']}/${data['Total']}"),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Obx(
                () => _serverUpdateController.isLoading_.value
                    ? const Loading(
                        loadingMessage: '',
                      )
                    : InkWell(
                        onTap: () => onClick(),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: DarkBlueButton(buttonText: "Home"),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
