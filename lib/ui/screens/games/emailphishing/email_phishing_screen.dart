import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/email_phishing_controller.dart';
import '../../../styles/images.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/quiz/body.dart';
import 'email_phishing_body.dart';

class EmailPhishingScreen extends StatefulWidget {
  @override
  State<EmailPhishingScreen> createState() => _EmailPhishingState();
}

class _EmailPhishingState extends State<EmailPhishingScreen> {
  final EmailPhishingController _questionController =
      Get.put(EmailPhishingController());
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  @override
  void initState() {
    super.initState();
    var quizQuestions = Get.arguments as String;
    _questionController.setQuestion(quizQuestions);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        appBar: const MyAppBar(),
        body: EmailPhishingBody(
            questionController: _questionController, tooltipkey: tooltipkey),
      ),
    );
  }
}
