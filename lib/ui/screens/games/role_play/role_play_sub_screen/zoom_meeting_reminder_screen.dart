import '../../../../../ui/widgets/my_app_bar.dart';
import '../../../../../ui/widgets/text/dark_text_body.dart';
import '../../../../../ui/widgets/text/light_text_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../styles/images.dart';
import '../../../../styles/my_app_theme.dart';
import '../../../../widgets/button/green_button.dart';
import '../../../../widgets/button/red_button.dart';
import '../../../../widgets/text/dark_text_head.dart';

class ZoomMeetingReminderScreen extends StatelessWidget {
  const ZoomMeetingReminderScreen({super.key});

  _submit(bool input) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Align(
                      //alignment: Alignment.center,
                      child: Image.asset(
                        Images.laptopComp,
                        fit: BoxFit.fitHeight,
                        height: Get.height * 0.6,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.size.height * 0.03,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: DarkTextHead(data: "Q1 All Hands Meeting"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Color(0xFF8064A2),
                              radius: 40,
                              child: LightTextBody(data: "ZM"),
                            ),
                            FittedBox(
                              child: DarkTextBody(
                                  data:
                                      "Zoom Meeting Reminder\n zoommeeting@your.xyz.ddcc.com\nTo: rk rk@gk.co"),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          Images.second,
                          height: Get.size.height * 0.3,
                          width: Get.size.width * 0.6,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => _submit(false),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: RedButton(
                    buttonText: "Report Phishing",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => _submit(false),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: GreenButton(
                    buttonText: "It's Legitimate",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
