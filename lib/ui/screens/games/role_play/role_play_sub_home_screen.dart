import 'package:PhishSim/ui/widgets/button/dark_blue_button.dart';
import 'package:PhishSim/utiles/utility.dart';

import '../../../../controller/server_update_controller.dart';
import '../../../../ui/routers/my_router.dart';
import '../../../../ui/widgets/text/dark_text_body.dart';
import '../../../../ui/widgets/text/light_text_sub_head.dart';
import 'package:get/get.dart';
import '../../../../ui/styles/my_app_theme.dart';
import 'package:flutter/material.dart';
import '../../../styles/images.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/my_app_bar.dart';

class RolePlaySubHomeScreen extends StatefulWidget {
  const RolePlaySubHomeScreen({super.key});

  @override
  State<RolePlaySubHomeScreen> createState() => _RolePlaySubHomeScreenState();
}

class _RolePlaySubHomeScreenState extends State<RolePlaySubHomeScreen> {
  final ServerUpdateController _serverUpdateController =
      Get.put(ServerUpdateController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(),
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              const LightTextSubHead(data: "Spot the Phis: A Game by WhiteHax"),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Stack(
                //alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Align(
                      //alignment: Alignment.center,
                      child: Image.asset(
                        Images.laptopComp,
                        fit: BoxFit.fitHeight,
                        height: Get.height * 0.8,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Container(
                    //  alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.045,
                        ),
                        Container(
                          height: Get.size.height * 0.08,
                          width: Get.size.height * 0.35,
                          color: MyAppTheme.whitehaxRolePlay,
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email,
                                  color: MyAppTheme.whitehaxBackgroundColor,
                                  size: 35,
                                ),
                              ),
                              DarkTextBody(data: "Ron's Inbox ron@gmail.com ")
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        InkWell(
                          onTap: () =>
                              Get.toNamed(MyRouter.markSpeckhardtScreen),
                          child: gameRows(
                              "Mark\nSpeckhardt",
                              "Document\nShared with\nyou:Expert\nreport.docx",
                              "10:20 AM"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(
                            height: 0.1,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        InkWell(
                          onTap: () =>
                              Get.toNamed(MyRouter.zoomMeetingReminderScreen),
                          child: gameRows("Zoom\nMeeting\nReminder",
                              "Q1 All\nHands\nMeeting", "1:20 PM"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(
                            height: 0.1,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(MyRouter.emmaScreen),
                          child: gameRows(
                              "Emma",
                              "Folder Shared\nwith you:\nMonthly_Content",
                              "3:20 PM"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(
                            height: 0.1,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        InkWell(
                          onTap: () =>
                              Get.toNamed(MyRouter.bankOfAmericaScreen),
                          child: gameRows("Bank\nof America",
                              "Your statement\nis available", "8:20 AM"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(
                            height: 0.1,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(MyRouter.payPalScreen),
                          child: gameRows("PayPal",
                              "New Login\nfrom Unknown\nDevice", "6:15AM"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(
                            height: 0.1,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Obx(
                          () => _serverUpdateController.isLoading_.value
                              ? const Loading(
                                  loadingMessage: '',
                                )
                              : InkWell(
                                  onTap: () {
                                    int score = Utility.getRoleGameScore();
                                    if (score == 0) {
                                      Utility.showInfo(
                                          "Please Play Game First");
                                      return;
                                    }
                                    _serverUpdateController.updateGame(
                                        "rolePlayGameDoc", score);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: DarkBlueButton(buttonText: "Submit"),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox gameRows(String firstStr, String secondStr, String thirdStr) {
    return SizedBox(
      height: Get.size.height * 0.08,
      width: Get.size.height * 0.35,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DarkTextBody(data: firstStr),
          DarkTextBody(data: secondStr),
          FittedBox(
            child: DarkTextBody(data: thirdStr),
          )
        ],
      ),
    );
  }
}
