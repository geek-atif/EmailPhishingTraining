import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui/styles/my_app_theme.dart';
import '../../controller/question_controller.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/quiz/body.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuestionController _questionController = Get.put(QuestionController());

  @override
  void initState() {
    super.initState();
    var quizQuestions = Get.arguments as String;
    _questionController.setQuestion(quizQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        appBar: const MyAppBar(),
        body: Body(questionController: _questionController),
      ),
    );
  }
}
