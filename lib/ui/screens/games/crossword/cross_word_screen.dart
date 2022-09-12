// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:word_search/word_search.dart';

// class CrosswordScreen extends StatefulWidget {
//   const CrosswordScreen({Key? key}) : super(key: key);

//   @override
//   _CrosswordScreenState createState() => _CrosswordScreenState();
// }

// class _CrosswordScreenState extends State<CrosswordScreen> {
//   // generate crossword char array
//   // example like this : [["x","x"],["x","x"]]

//   // sorry. hhahaa
//   int numBoxPerRow = 6;
//   double padding = 5;
//   // sory .. not assign this yet.. :(
//   Size sizeBox = Size.zero;

//   late ValueNotifier<List<List<String>>> listChars;
//   // save all answers on generate crossword data
//   late ValueNotifier<List<CrosswordAnswer>> answerList;
//   late ValueNotifier<CurrentDragObj> currentDragObj;
//   late ValueNotifier<List<int>> charsDone;

//   @override
//   void initState() {
//     super.initState();
//     listChars = ValueNotifier<List<List<String>>>([]);
//     answerList = ValueNotifier<List<CrosswordAnswer>>([]);
//     currentDragObj = ValueNotifier<CurrentDragObj>(CurrentDragObj());
//     charsDone = ValueNotifier<List<int>>([]);
//     // generate char array crossword
//     generateRandomWord();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Container(
//       child: Column(
//         children: [
//           Container(
//             color: Colors.blue,
//             alignment: Alignment.center,
//             width: double.maxFinite,
//             height: size.width - padding * 2,
//             padding: EdgeInsets.all(padding),
//             margin: EdgeInsets.all(padding),
//             child: drawCrosswordBox(),
//           ),
//           Container(
//             alignment: Alignment.center,
//             // lets show list word we need solve
//             child: drawAnswerList(),
//           ),
//         ],
//       ),
//     );
//   }

//   void onDragEnd(PointerUpEvent event) {
//     print("PointerUpEvent");
//     // check if drag line object got value or not.. if no no need to clear
//     if (currentDragObj.value.currentDragLine == null) return;

//     currentDragObj.value.currentDragLine.clear();
//     currentDragObj.notifyListeners();
//   }

//   void onDragUpdate(PointerMoveEvent event) {
//     // generate ondragLine so we know to highlight path later & clear if condition dont meet .. :D
//     generateLineOnDrag(event);

//     // get index on drag

//     int indexFound = answerList.value.indexWhere((answer) {
//       return answer.answerLines.join("-") ==
//           currentDragObj.value.currentDragLine.join("-");
//     });

//     print(currentDragObj.value.currentDragLine.join("-"));
//     if (indexFound >= 0) {
//       answerList.value[indexFound].done = true;
//       // save answerList which complete
//       charsDone.value.addAll(answerList.value[indexFound].answerLines);
//       charsDone.notifyListeners();
//       answerList.notifyListeners();
//       onDragEnd(null);
//     }
//   }

//   int calculateIndexBasePosLocal(Offset localPosition) {
//     // get size max per box
//     double maxSizeBox =
//         ((sizeBox.width - (numBoxPerRow - 1) * padding) / numBoxPerRow);

//     if (localPosition.dy > sizeBox.width || localPosition.dx > sizeBox.width)
//       return -1;

//     int x = 0, y = 0;
//     double yAxis = 0, xAxis = 0;
//     double yAxisStart = 0, xAxisStart = 0;

//     for (var i = 0; i < numBoxPerRow; i++) {
//       xAxisStart = xAxis;
//       xAxis += maxSizeBox +
//           (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

//       if (xAxisStart < localPosition.dx && xAxis > localPosition.dx) {
//         x = i;
//         break;
//       }
//     }

//     for (var i = 0; i < numBoxPerRow; i++) {
//       yAxisStart = yAxis;
//       yAxis += maxSizeBox +
//           (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

//       if (yAxisStart < localPosition.dy && yAxis > localPosition.dy) {
//         y = i;
//         break;
//       }
//     }

//     return y * numBoxPerRow + x;
//   }

//   void generateLineOnDrag(PointerMoveEvent event) {
//     // if current drag line is null, dlcare new list for we can save value
//     if (currentDragObj.value.currentDragLine == null)
//       currentDragObj.value.currentDragLine = List<int>();

//     // we need calculate index array base local position on drag
//     int indexBase = calculateIndexBasePosLocal(event.localPosition);

//     if (indexBase >= 0) {
//       // check drag line already pass 2 box
//       if (currentDragObj.value.currentDragLine.length >= 2) {
//         // check drag line is straight line
//         WSOrientation wsOrientation;

//         if (currentDragObj.value.currentDragLine[0] % numBoxPerRow ==
//             currentDragObj.value.currentDragLine[1] % numBoxPerRow)
//           wsOrientation =
//               WSOrientation.vertical; // this should vertical.. my mistake.. :)
//         else if (currentDragObj.value.currentDragLine[0] ~/ numBoxPerRow ==
//             currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
//           wsOrientation = WSOrientation.horizontal;

//         if (wsOrientation == WSOrientation.horizontal) {
//           if (indexBase ~/ numBoxPerRow !=
//               currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
//             onDragEnd(null);
//         } else if (wsOrientation == WSOrientation.vertical) {
//           if (indexBase % numBoxPerRow !=
//               currentDragObj.value.currentDragLine[1] % numBoxPerRow)
//             onDragEnd(null);
//         } else
//           onDragEnd(null);
//       }

//       if (!currentDragObj.value.currentDragLine.contains(indexBase))
//         currentDragObj.value.currentDragLine.add(indexBase);
//       else if (currentDragObj.value.currentDragLine.length >=
//           2) if (currentDragObj.value.currentDragLine[
//               currentDragObj.value.currentDragLine.length - 2] ==
//           indexBase) onDragEnd(null);
//     }
//     // before mistake , should in here
//     currentDragObj.notifyListeners();
//   }

//   void onDragStart(int indexArray) {
//     try {
//       List<CrosswordAnswer> indexSelecteds = answerList.value
//           .where((answer) => answer.indexArray == indexArray)
//           .toList();

//       // check indexSelecteds got any match , if 0 no proceed!
//       if (indexSelecteds.length == 0) return;
//       // nice triggered
//       currentDragObj.value.indexArrayOnTouch = indexArray;
//       currentDragObj.notifyListeners();
//     } catch (e) {}
//   }

//   // nice one

//   Widget drawCrosswordBox() {
//     // add listener tp catch drag, push down & up
//     return Listener(
//       onPointerUp: (event) => onDragEnd(event),
//       onPointerMove: (event) => onDragUpdate(event),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           sizeBox = Size(constraints.maxWidth, constraints.maxWidth);
//           return GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               childAspectRatio: 1,
//               crossAxisCount: numBoxPerRow,
//               crossAxisSpacing: padding,
//               mainAxisSpacing: padding,
//             ),
//             itemCount: numBoxPerRow * numBoxPerRow,
//             physics: ScrollPhysics(),
//             itemBuilder: (context, index) {
//               // we need expand because to merge 2d array to become 1..
//               // example [["x","x"],["x","x"]] become ["x","x","x","x"]
//               String char = listChars.value.expand((e) => e).toList()[index];

//               // yeayy.. now we got crossword box.. easy right!!
//               // later i will show how to display current word on crossword
//               // next show color path on box when drag, we will using Valuelistener
//               // done .. yeayy.. this is simple crossword system
//               return Listener(
//                 onPointerDown: (event) => onDragStart(index),
//                 child: ValueListenableBuilder(
//                   valueListenable: currentDragObj,
//                   builder: (context, CurrentDragObj value, child) {
//                     Color color = Colors.yellow;

//                     if (value.currentDragLine.contains(index)) {
//                       color = Colors.blue;
//                     } else if (charsDone.value.contains(index))
//                       color =
//                           Colors.red; // change color box already path correct

//                     return Container(
//                       decoration: BoxDecoration(
//                         color: color,
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         char.toUpperCase(),
//                         style: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   void generateRandomWord() {
//     // this words we want put on crossword game
//     final List<String> wl = ['hello', 'world', 'foo', 'bar', 'baz', 'dart'];

//     // setup configuration to generate crossword

//     // Create the puzzle sessting object
//     final WSSettings ws = WSSettings(
//       width: numBoxPerRow,
//       height: numBoxPerRow,
//       orientations: List.from([
//         WSOrientation.horizontal,
//         WSOrientation.horizontalBack,
//         WSOrientation.vertical,
//         WSOrientation.verticalUp,
//         // WSOrientation.diagonal,
//         // WSOrientation.diagonalUp,
//       ]),
//     );

//     // Create new instance of the WordSearch class
//     final WordSearch wordSearch = WordSearch();

//     // Create a new puzzle
//     final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

//     /// Check if there are errors generated while creating the puzzle
//     if (newPuzzle.errors.isEmpty) {
//       // if no error.. proceed

//       // List<List<String>> charsArray = newPuzzle.puzzle;
//       listChars.value = newPuzzle.puzzle;
//       // done pass..ez

//       // Solve puzzle for given word list
//       final WSSolved solved = wordSearch.solvePuzzle(newPuzzle.puzzle, wl);

//       answerList.value = solved.found
//           .map((solve) => CrosswordAnswer(solve, numPerRow: numBoxPerRow))
//           .toList();
//     }
//   }

//   drawAnswerList() {
//     return Container(
//       child: ValueListenableBuilder(
//         valueListenable: answerList,
//         builder: (context, List<CrosswordAnswer> value, child) {
//           // lets make custom widget using Column & Row

//           // how many row child we want show per row?
//           int perColTotal = 3;

//           // generate using list.generate
//           List<Widget> list = List.generate(
//               (value.length ~/ perColTotal) +
//                   ((value.length % perColTotal) > 0 ? 1 : 0), (int index) {
//             int maxColumn = (index + 1) * perColTotal;

//             return Container(
//               margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               child: Row(
//                 // generate child row per row
//                 // all close on each other.. let make row child distance equally
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(
//                     maxColumn > value.length
//                         ? maxColumn - value.length
//                         : perColTotal, ((indexChild) {
//                   // forgot to declare array for access answerList
//                   int indexArray = (index) * perColTotal + indexChild;

//                   return Text(
//                     // make text more clearly to read
//                     "${value[indexArray].wsLocation.word}",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color:
//                           value[indexArray].done ? Colors.green : Colors.black,
//                       decoration: value[indexArray].done
//                           ? TextDecoration.lineThrough
//                           : TextDecoration.none,
//                     ),
//                   );
//                 })).toList(),
//               ),
//             );
//           }).toList();

//           return Container(
//             child: Column(
//               children: list,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CurrentDragObj {
//   Offset currentDragPos;
//   Offset currentTouch;
//   int indexArrayOnTouch;
//   List<int> currentDragLine = [];

//   CurrentDragObj({
//     required this.currentDragPos,
//     required this.currentTouch,
//     required this.indexArrayOnTouch,
//   });

//   CurrentDragObj copyWith({
//     Offset? currentDragPos,
//     Offset? currentTouch,
//     int? indexArrayOnTouch,
//   }) {
//     return CurrentDragObj(
//       currentDragPos: currentDragPos ?? this.currentDragPos,
//       currentTouch: currentTouch ?? this.currentTouch,
//       indexArrayOnTouch: indexArrayOnTouch ?? this.indexArrayOnTouch,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'currentDragPos': currentDragPos.toMap(),
//       'currentTouch': currentTouch.toMap(),
//       'indexArrayOnTouch': indexArrayOnTouch,
//     };
//   }

//   factory CurrentDragObj.fromMap(Map<String, dynamic> map) {
//     return CurrentDragObj(
//       currentDragPos: Offset.fromMap(map['currentDragPos']),
//       currentTouch: Offset.fromMap(map['currentTouch']),
//       indexArrayOnTouch: map['indexArrayOnTouch']?.toInt() ?? 0,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CurrentDragObj.fromJson(String source) =>
//       CurrentDragObj.fromMap(json.decode(source));

//   @override
//   String toString() =>
//       'CurrentDragObj(currentDragPos: $currentDragPos, currentTouch: $currentTouch, indexArrayOnTouch: $indexArrayOnTouch)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is CurrentDragObj &&
//         other.currentDragPos == currentDragPos &&
//         other.currentTouch == currentTouch &&
//         other.indexArrayOnTouch == indexArrayOnTouch;
//   }

//   @override
//   int get hashCode =>
//       currentDragPos.hashCode ^
//       currentTouch.hashCode ^
//       indexArrayOnTouch.hashCode;
// }

// class CrosswordAnswer {
//   bool done = false;
//   int indexArray;
//   WSLocation wsLocation;
//   List<int> answerLines;

//   CrosswordAnswer(this.wsLocation, {required int numPerRow}) {
//     this.indexArray = this.wsLocation.y * numPerRow + this.wsLocation.x;
//     generateAnswerLine(numPerRow);
//   }

//   // get answer index for each character word
//   void generateAnswerLine(int numPerRow) {
//     // declare new list<int>
//     this.answerLines = List<int>();

//     // push all index based base word array
//     this.answerLines.addAll(List<int>.generate(this.wsLocation.overlap,
//         (index) => generateIndexBaseOnAxis(this.wsLocation, index, numPerRow)));
//   }

// // calculate index base axis x & y
//   generateIndexBaseOnAxis(WSLocation wsLocation, int i, int numPerRow) {
//     int x = wsLocation.x, y = wsLocation.y;

//     if (wsLocation.orientation == WSOrientation.horizontal ||
//         wsLocation.orientation == WSOrientation.horizontalBack)
//       x = (wsLocation.orientation == WSOrientation.horizontal) ? x + i : x - i;
//     else
//       y = (wsLocation.orientation == WSOrientation.vertical) ? y + i : y - i;

//     return x + y * numPerRow;
//   }
// }
