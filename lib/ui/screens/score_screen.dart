import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controller/question_controller.dart';
import '../styles/images.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //SvgPicture.asset(Images.bg, fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text("Score", style: Theme.of(context).textTheme.headline3),
              Text(
                  "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                  style: Theme.of(context).textTheme.headline4),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
