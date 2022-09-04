import 'package:PhishSim/utiles/sound_constant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../../../controller/email_phishing_controller.dart';
import '../../../../model/questions.dart';
import '../../../../utiles/constant.dart';
import '../../../widgets/dialogs/dialogs_confetti.dart';
import '../../../widgets/text/light_text_sub_head.dart';
import 'email_phishing_option.dart';

class EmailPhishingQuestionCard extends StatefulWidget {
  EmailPhishingQuestionCard({
    // it means we have to pass this
    required this.question,
    required this.tooltipkey,
  }) : super();

  final Question question;
  final GlobalKey<TooltipState> tooltipkey;

  @override
  State<EmailPhishingQuestionCard> createState() =>
      _EmailPhishingQuestionCardState();
}

class _EmailPhishingQuestionCardState extends State<EmailPhishingQuestionCard> {
  late AudioPlayer player;
  final GlobalKey<State> keyLoader = GlobalKey<State>();
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

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
            LightTextSubHead(data: widget.question.question),

            const SizedBox(height: 10),
            widget.question.image.isEmpty
                ? Text("")
                : Tooltip(
                    key: widget.tooltipkey,
                    triggerMode: TooltipTriggerMode.manual,
                    showDuration: const Duration(seconds: 20),
                    message: 'Eamil Address',
                    child: ZoomOverlay(
                      minScale: 0.5, // Optional
                      maxScale: 3.0, // Optional
                      twoTouchOnly: true, // Defaults to false
                      child: Image.asset(widget.question.image),
                    ),
                  ),
            const SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              widget.question.options.length,
              (index) => EmailPhishingOption(
                  index: index,
                  text: widget.question.options[index],
                  press: () async {
                    _controller.checkAns(widget.question, index);
                    var _correctAns = widget.question.answer;
                    var _selectedAns = index;
                    //widget.tooltipkey.currentState?.ensureTooltipVisible();
                    if (_correctAns == _selectedAns) {
                      await player.setAsset(SoundConstant.correct);
                      player.play();
                      MyDialogsConfetti.showLoadingDialog(context, keyLoader);
                    } else {
                      await player.setAsset(SoundConstant.incorrect);
                      player.play();
                    }
                  },
                  tooltipkey: widget.tooltipkey),
            ),
          ],
        ),
      ),
    );
  }
}
