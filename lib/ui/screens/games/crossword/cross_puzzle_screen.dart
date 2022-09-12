import '../../../../ui/screens/games/crossword/word_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrossPuzzleScreen extends StatefulWidget {
  const CrossPuzzleScreen({super.key});

  @override
  State<CrossPuzzleScreen> createState() => _CrossPuzzleScreenState();
}

class _CrossPuzzleScreenState extends State<CrossPuzzleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    lettersMap =
        Map.fromIterable(letters, key: (i) => GlobalKey(), value: (i) => i[0]);
    isSelected = List.generate(letters.length, (e) => false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<bool> isSelected = [];
  List<String> selectedLetters = [];
  late Map<GlobalKey, String> lettersMap;

  Offset initialTappedPosition = Offset(0, 0);
  Offset initialPosition = Offset(0, 0);
  late Offset finalPosition;

  late int intialSquare;
  int crossAxisCount =
      4; //whether you use GridView or not still need to provide this
  int index = -1;
  bool isTapped = false;

  String selectedWord = '';

  double width = 50;
  double height = 50;
  Size size = Get.size;

  List<String> letters = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'b',
    'b',
    'b',
    'b',
    'z',
  ];

  _determineWord() {
    double differnce;
    int numberOfSquares;

    if ((finalPosition.dx - initialPosition.dx) > 20) {
      print('right');

      //moved right
      differnce = finalPosition.dx - initialPosition.dx;
      numberOfSquares = (differnce / size.width).ceil();
      for (int i = intialSquare + 1;
          i < (intialSquare + numberOfSquares);
          i++) {
        isSelected[i] = true;
      }
      for (int i = 0; i < isSelected.length; i++) {
        if (isSelected[i]) {
          selectedWord += letters[i];
        }
      }
      print(selectedWord);
    } else if ((initialPosition.dx - finalPosition.dx) > 20) {
      print('left');

      // moved left
      differnce = finalPosition.dx + initialPosition.dx;
      numberOfSquares = (differnce / size.width).ceil();
      for (int i = intialSquare - 1;
          i >= (intialSquare - numberOfSquares + 1);
          i--) {
        isSelected[i] = true;
      }
      for (int i = 0; i < isSelected.length; i++) {
        if (isSelected[i]) {
          selectedWord += letters[i];
        }
      }
      print(selectedWord);
    } else if ((finalPosition.dy - initialPosition.dy) > 20) {
      //moved up when moving up/down number of squares numberOfSquares is also number of rows

      differnce = finalPosition.dy - initialPosition.dy;
      numberOfSquares = (differnce / size.height).ceil();

      for (int i = intialSquare + crossAxisCount;
          i < (intialSquare + (numberOfSquares * crossAxisCount));
          i += 4) {
        isSelected[i] = true;
      }
      for (int i = 0; i < isSelected.length; i++) {
        if (isSelected[i]) {
          selectedWord += letters[i];
        }
      }

      print(selectedWord);
    } else if ((initialPosition.dy - finalPosition.dy) > 20) {
      //moved down
      differnce = initialPosition.dy - finalPosition.dy;
      numberOfSquares = (differnce / size.height).ceil();

      for (int i = intialSquare - crossAxisCount;
          i > (intialSquare - (numberOfSquares * crossAxisCount));
          i -= 4) {
        isSelected[i] = true;
        print('$i');
      }
      for (int i = isSelected.length - 1; i >= 0; i--) {
        if (isSelected[i]) {
          selectedWord += letters[i];
        }
      }
      print(selectedWord);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: WordSearch(
          wordsPerLine: 11,
          alphabet: [
            'I',
            'A',
            'G',
            'M',
            'F',
            'Y',
            'L',
            'I',
            'R',
            'V',
            'P',
            'D',
            'B',
            'R',
            'A',
            'I',
            'N',
            'S',
            'T',
            'O',
            'R',
            'M',
            'E',
            'S',
            'S',
            'T',
            'R',
            'A',
            'T',
            'E',
            'G',
            'Y',
            'E',
            'A',
            'B',
            'W',
            'O',
            'M',
            'G',
            'O',
            'A',
            'L',
            'S',
            'X',
            'S',
            'Q',
            'U',
            'K',
            'H',
            'J',
            'P',
            'M',
            'D',
            'W',
            'S'
          ],
          words: [
            'ARTHER',
            'GOLDEN',
            'AMADEUS',
            'IDEAS',
            'GOALS',
            'BRAINSTORM'
          ],
        )

        //stackWi(),
        );
  }

  Stack stackWi() {
    return Stack(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 2,
                ),
                children: <Widget>[
                  for (int i = 0; i != lettersMap.length; ++i)
                    Listener(
                      child: Container(
                        key: lettersMap.keys.toList()[i],
                        child: Text(
                          lettersMap.values.toList()[i],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      onPointerDown: (PointerDownEvent event) {
                        final RenderObject? renderBox = lettersMap.keys
                            .toList()[i]
                            .currentContext!
                            .findRenderObject();
                        //size = renderBox?.sizedByParent;
                        setState(() {
                          isSelected[i] = true;
                          intialSquare = i;
                        });
                      },
                    ),
                ],
              ),
              onTapDown: (TapDownDetails details) {
                //User Taps Screen
                // print('Global Position: ${details.globalPosition}');
                setState(() {
                  initialPosition = Offset(
                    details.globalPosition.dx - 25,
                    details.globalPosition.dy - 25,
                  );
                  initialTappedPosition = Offset(
                    details.globalPosition.dx - 25,
                    details.globalPosition.dy - 25,
                  );
                  isTapped = true;
                });
                // print(initialPosition);
              },
              onVerticalDragUpdate: (DragUpdateDetails details) {
                // print('${details.delta.dy}');
                setState(() {
                  if (details.delta.dy < 0) {
                    initialTappedPosition = Offset(initialTappedPosition.dx,
                        initialTappedPosition.dy + details.delta.dy);
                    height -= details.delta.dy;
                  } else {
                    height += details.delta.dy;
                  }
                  finalPosition = Offset(
                    details.globalPosition.dx - 25,
                    details.globalPosition.dy - 25,
                  );
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                // print('${details.delta.dx}');
                setState(() {
                  if (details.delta.dx < 0) {
                    initialTappedPosition = Offset(
                      initialTappedPosition.dx + details.delta.dx,
                      initialTappedPosition.dy,
                    );
                    width -= details.delta.dx;
                  } else {
                    width += details.delta.dx;
                  }

                  finalPosition = Offset(
                    details.globalPosition.dx - 25,
                    details.globalPosition.dy - 25,
                  );
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                _determineWord();
              },
              onVerticalDragEnd: (DragEndDetails details) {
                _determineWord();
              },
            ),
          ),
        ),
        Positioned(
          top: initialTappedPosition.dy,
          left: initialTappedPosition.dx,
          child: Container(
            height: height,
            width: width,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: isTapped ? Colors.blue : Colors.transparent,
                  width: 3.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
