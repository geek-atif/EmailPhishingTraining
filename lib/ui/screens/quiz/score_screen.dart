import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ui/widgets/button/dark_blue_button.dart';
import '../../../ui/widgets/text/light_text_body.dart';
import '../../../ui/widgets/text/light_text_head.dart';
import '../../../../ui/widgets/text/light_text_sub_head.dart';
import '../../../../ui/styles/my_app_theme.dart';
import '../../routers/my_router.dart';

class ScoreScreen extends StatefulWidget {
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late var data;
  @override
  void initState() {
    data = Get.arguments as Map;
    super.initState();
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
              LightTextHead(data: "Total Score "),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              LightTextHead(data: "${data['Ans']}/${data['Total']}"),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              InkWell(
                onTap: () => Get.offAndToNamed(MyRouter.homeScreen),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: DarkBlueButton(buttonText: "Home"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
