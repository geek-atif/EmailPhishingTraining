import '../../../../ui/widgets/text/light_text_body_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../ui/styles/my_app_theme.dart';
import '../../../../ui/widgets/text/light_text_body.dart';
import '../../../../controller/word_game_controller.dart';
import '../../../../model/word_game.dart';
import '../../button/dark_blue_button.dart';
import '../../text/light_text_body_green.dart';
import '../../text/light_text_body_red.dart';

class WordEditCard extends StatefulWidget {
  const WordEditCard({
    Key? key,
    required this.wordGame,
    required this.index,
    required this.wordGameController,
    required this.wordHint,
  }) : super(key: key);
  final WordGame wordGame;
  final int index;
  final WordGameController wordGameController;
  final String wordHint;

  @override
  State<WordEditCard> createState() => _WordEditCardState();
}

class _WordEditCardState extends State<WordEditCard> {
  String acceptedData = "";
  late List<String> words;
  late List<String> questions;
  final _formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    words = widget.wordGame.answer.split("");
    questions = widget.wordGame.answer.split("");
    questions.shuffle();
  }

  _submit(String words) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    widget.wordGameController.checkAns(words, acceptedData, widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                questions.length,
                (index) => questionCard(questions[index]),
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.only(top: 25, left: 50, right: 50),
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: textController,
              maxLength: words.length,
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                errorStyle: const TextStyle(color: MyAppTheme.errorRed),
                fillColor: Colors.grey[350],
                filled: true,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 25.0, 0.2, 25.0),
                alignLabelWithHint: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                      const BorderSide(color: MyAppTheme.whitehaxSubColor),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: MyAppTheme.whitehaxSubColor),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter answer';
                }
              },
              onSaved: (value) {
                print("onSaved() called");
                acceptedData = value!.toString();
              },
              onFieldSubmitted: (value) {
                print("onSaved() called");
                acceptedData = value.toString();
              },
            ),
          ),
        ),
        Row(
          children: [
            Spacer(),
            Spacer(),
            Spacer(),
            InkWell(
              child: Tooltip(
                key: tooltipkey,
                triggerMode: TooltipTriggerMode.manual,
                showDuration: const Duration(seconds: 2),
                message: widget.wordHint,
                margin: const EdgeInsets.only(left: 20, right: 20),
                //textAlign: TextAlign.justify,
                preferBelow: false,
                child: InkWell(
                    onTap: () =>
                        tooltipkey.currentState?.ensureTooltipVisible(),
                    child: const LightTextSub(data: "Hint")),
              ),
            ),
            Spacer(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Obx(
            () => widget.wordGameController.ansStatus == 0
                ? const Text("")
                : widget.wordGameController.ansStatus == 1
                    ? LightTextBodyGreen(data: "Correct")
                    : const LightTextBodyRed(data: "In-Correct "),
          ),
        ),
        InkWell(
          onTap: () => _submit(widget.wordGame.answer),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
            child: DarkBlueButton(buttonText: "Next"),
          ),
        )
      ],
    );
  }

  Padding questionCard(String question) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          color: MyAppTheme.whitehaxSubColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: MyAppTheme.whitehaxdialog, //
            width: 2.0,
          ),
        ),
        child: Center(
          child: LightTextBody(data: question),
        ),
      ),
    );
  }
}
