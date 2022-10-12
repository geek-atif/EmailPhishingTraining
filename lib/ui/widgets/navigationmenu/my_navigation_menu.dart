import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utiles/utility.dart';
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
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: MyAppTheme.whitehaxdialog,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 25),
        child: Column(
          children: <Widget>[
            _head(screenSize),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            tutorialWidg(),
            quizWidg(),
            gameWidg(screenSize),
            report(screenSize),
            //simpleLogin(screenSize),
            // debugWid(screenSize),
            logoutWidg(screenSize),
          ],
        ),
      ),
    );
  }

  Column _head(Size screenSize) {
    return Column(
      children: [
        Icon(
          Icons.person,
          size: screenSize.height * 0.1,
          color: Colors.white,
        ),
        Center(
          child: LightTextSubHead(data: Utility.getUserName()),
        ),
        Center(
          child: LightTextBody(data: Utility.getEmailAddress()),
        ),
        Center(
          child: LightTextBody(data: Utility.getCompanyName()),
        ),
      ],
    );
  }

  Expanded logoutWidg(Size screenSize) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: InkWell(
          onTap: () => Utility.logout(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 30),
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  size: screenSize.height * 0.035,
                  color: Colors.white,
                ),
                SizedBox(
                  width: screenSize.width * 0.035,
                ),
                const LightTextSubHead(data: "Logout"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ExpansionTile gameWidg(Size screenSize) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.only(bottom: 10),
      title: const LightTextSubHead(
        data: "Games",
      ),
      children: <Widget>[
        InkWell(
          onTap: () => Get.toNamed(MyRouter.wordGameScreen),
          child: const LightTextBody(data: "Word Scrabble"),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(MyRouter.emailPhishingScreen,
              arguments: "phishingEmailGame"),
          child: const LightTextBody(data: "Role Play"),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(
            MyRouter.myWebView,
          ),
          child: const LightTextBody(data: "Puzzle"),
        ),
      ],
      iconColor: Colors.white,
      leading: const Icon(
        Icons.games,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  ExpansionTile quizWidg() {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.only(bottom: 10),
      title: const LightTextSubHead(
        data: "Quizzes",
      ),
      children: <Widget>[
        InkWell(
          onTap: () =>
              Get.toNamed(MyRouter.quizScreen, arguments: "phishingQuiz"),
          child: const LightTextBody(data: "Quiz"),
          //Phishing
        ),
      ],
      iconColor: Colors.white,
      leading: const Icon(
        Icons.quiz_outlined,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  ExpansionTile tutorialWidg() {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.only(bottom: 10),
      title: const LightTextSubHead(
        data: "Tutorials",
      ),
      children: <Widget>[
        InkWell(
            onTap: () => Get.toNamed(MyRouter.phishingStepOne),
            child: const LightTextBody(data: "3-Steps Detect")),
        const SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () => Get.toNamed(MyRouter.officePhishingOne),
            child: const LightTextBody(data: "Office365 Risks")),
      ],
      iconColor: Colors.white,
      leading: const Icon(
        Icons.read_more,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  ExpansionTile simpleLogin(Size screenSize) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.only(bottom: 10),
      title: const LightTextSubHead(
        data: "Simple Login",
      ),
      children: <Widget>[
        InkWell(
          onTap: () => Get.toNamed(MyRouter.simpleLoginScreen),
          child: const LightTextBody(data: "Simple login"),
        ),
      ],
      iconColor: Colors.white,
      leading: const Icon(
        Icons.games,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  ExpansionTile report(Size screenSize) {
    return ExpansionTile(
        collapsedIconColor: Colors.white,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        title: InkWell(
          onTap: () => Get.toNamed(MyRouter.mainReportScreen),
          child: const LightTextSubHead(
            data: "Report",
          ),
        ),
        children: <Widget>[]);
  }

  ExpansionTile debugWid(Size screenSize) {
    return ExpansionTile(
        collapsedIconColor: Colors.white,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.only(bottom: 10),
        title: InkWell(
          onTap: () => Get.toNamed(MyRouter.debugScreen),
          child: const LightTextSubHead(
            data: "Debug",
          ),
        ),
        children: <Widget>[]);
  }
}
