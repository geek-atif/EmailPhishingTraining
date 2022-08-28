import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routers/my_router.dart';
import '../../styles/my_app_theme.dart';
import '../text/light_text_body.dart';
import '../text/light_text_sub_head.dart';

class MyNavigationMenu extends StatelessWidget {
  const MyNavigationMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyAppTheme.whitehaxdialog,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: ListView(
          children: <Widget>[
            ExpansionTile(
              collapsedIconColor: Colors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              childrenPadding: const EdgeInsets.only(bottom: 10),
              title: const LightTextSubHead(
                data: "Tutorial",
              ),
              children: <Widget>[
                InkWell(
                    onTap: () => Get.toNamed(MyRouter.officePhishing),
                    child: const LightTextBody(data: "Office 365")),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () => Get.toNamed(MyRouter.phishingStepOne),
                    child: const LightTextBody(data: "3 Step Phishing")),
              ],
              iconColor: Colors.white,
              leading: const Icon(
                Icons.read_more,
                color: Colors.white,
                size: 25,
              ),
            ),
            ExpansionTile(
              collapsedIconColor: Colors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              childrenPadding: const EdgeInsets.only(bottom: 10),
              title: const LightTextSubHead(
                data: "Quiz",
              ),
              children: <Widget>[
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.quizScreen,
                      arguments: "phishingQuiz"),
                  child: const LightTextBody(data: "Phishing"),
                ),
              ],
              iconColor: Colors.white,
              leading: const Icon(
                Icons.quiz_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
            ExpansionTile(
              collapsedIconColor: Colors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              childrenPadding: const EdgeInsets.only(bottom: 10),
              title: const LightTextSubHead(
                data: "Game",
              ),
              children: <Widget>[
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.wordGameScreen),
                  child: const LightTextBody(data: "Word Game"),
                ),
              ],
              iconColor: Colors.white,
              leading: const Icon(
                Icons.games,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),

        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const SizedBox(
        //           height: 30,
        //         ),
        //         Row(
        //           children: const [
        //             Icon(
        //               Icons.read_more,
        //               color: Colors.white,
        //               size: 25,
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             LightTextSubHead(
        //               data: "Tutorial",
        //             ),
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 15,
        //         ),
        //         Row(
        //           children: const [
        //             Icon(
        //               Icons.quiz_outlined,
        //               color: Colors.white,
        //               size: 25,
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             LightTextSubHead(
        //               data: "Quiz",
        //             ),
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 15,
        //         ),
        //         Row(
        //           children: const [
        //             Icon(
        //               Icons.games,
        //               color: Colors.white,
        //               size: 25,
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             LightTextSubHead(
        //               data: "Game",
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ),
    );
  }
}
