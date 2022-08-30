import 'package:flutter/material.dart';
import 'package:threattraining/ui/styles/my_app_theme.dart';
import 'package:threattraining/ui/widgets/text/light_text_body.dart';
import '../../../../controller/word_game_controller.dart';
import '../../../../model/word_game.dart';

class WordDraggableCard extends StatefulWidget {
  const WordDraggableCard(
      {Key? key,
      required this.wordGame,
      required this.index,
      required this.wordGameController})
      : super(key: key);
  final WordGame wordGame;
  final int index;
  final WordGameController wordGameController;

  @override
  State<WordDraggableCard> createState() => _WordDraggableCardState();
}

class _WordDraggableCardState extends State<WordDraggableCard> {
  String acceptedData = "";
  late List<String> words;
  late List<String> questions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    words = widget.wordGame.answer.split("");
    questions = widget.wordGame.question.split("");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ...List.generate(
              words.length,
              (index) => dragTagetWid(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        Row(
          children: [
            ...List.generate(
              words.length,
              (index) => wordGameCard(words[index]),
            ),
          ],
        ),

        // ListView.builder(
        //   physics: const ClampingScrollPhysics(),
        //   shrinkWrap: true,
        //   scrollDirection: Axis.horizontal,
        //   itemCount: words.length,
        //   itemBuilder: (BuildContext context, int index) =>
        //       wordGameCard(words[index]),
        //   // SingleChildScrollView(
        //   //   scrollDirection: Axis.horizontal,
        //   //   child: Row(
        //   //     children: <Widget>[
        //   //       const SizedBox(height: 20),
        //   //       ...List.generate(
        //   //         words.length,
        //   //         (index) => wordGameCard(words[index]),
        //   //       ),
        //   //     ],
        //   //   ),
        //   // );
        // ),
      ],
    );
  }

  DragTarget<String> dragTagetWid() {
    return DragTarget<String>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 65.0,
            width: 65.0,
            decoration: BoxDecoration(
              color: MyAppTheme.whitehaxSubColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: MyAppTheme.whitehaxdialog, //
                width: 2.0,
              ),
            ),
            child: Center(
              child: LightTextBody(data: '$acceptedData'),
            ),
          ),
        );
      },
      onAccept: (String data) {
        print('data ${data}');
        setState(() {
          acceptedData = data;
        });
      },
    );
  }

  Draggable wordGameCard(_characters) {
    return Draggable<String>(
      // Data is the value this Draggable stores.
      data: _characters,
      feedback: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(_characters),
        ),
      ),

      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(_characters),
        ),
      ),
    );
  }
}
