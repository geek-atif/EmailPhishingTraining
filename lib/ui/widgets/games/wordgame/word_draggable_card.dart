import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    words = widget.wordGame.question.split("");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          const SizedBox(height: 20),
          ...List.generate(
            words.length,
            (index) => wordGameCard(words[index]),
          ),
        ],
      ),
    );
  }

  Column wordGameCard(_characters) {
    return Column(
      children: [
        DragTarget<String>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('$acceptedData'),
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
        ),
        const SizedBox(height: 20),
        Draggable<String>(
          // Data is the value this Draggable stores.
          data: _characters,
          feedback: Container(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 50.0,
            height: 50.0,
            child: const Icon(Icons.directions_run),
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
        ),
      ],
    );
  }
}
