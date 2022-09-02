import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import '../../../../controller/email_phishing_controller.dart';
import '../../../../model/questions.dart';
import '../../../../utiles/constant.dart';
import '../../../widgets/quiz/option.dart';
import '../../../widgets/text/light_text_sub_head.dart';

class EmailPhishingQuestionCard extends StatelessWidget {
  const EmailPhishingQuestionCard({
    // it means we have to pass this
    required this.question,
  }) : super();

  final Question question;

  @override
  Widget build(BuildContext context) {
    EmailPhishingController _controller = Get.put(EmailPhishingController());
    return SingleChildScrollView(
      // margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      // padding: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(25),
      // ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   question.question,
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            LightTextSubHead(data: question.question),

            const SizedBox(height: 10),
            question.image.isEmpty
                ? Text("")
                : ZoomOverlay(
                    minScale: 0.5, // Optional
                    maxScale: 3.0, // Optional
                    twoTouchOnly: true, // Defaults to false
                    child: Image.asset(question.image),
                  ),
            const SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              question.options.length,
              (index) => Option(
                index: index,
                text: question.options[index],
                press: () => _controller.checkAns(question, index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
