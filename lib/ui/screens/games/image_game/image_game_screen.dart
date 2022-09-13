// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'corret_overlay.dart';
// import 'puzzle_piece.dart';
// import 'score_widget.dart';

// class InageGameScreen extends StatefulWidget {
//   const InageGameScreen({super.key});

//   @override
//   State<InageGameScreen> createState() => _InageGameScreenState();
// }

// class _InageGameScreenState extends State<InageGameScreen> {
//   final int rows = 3;
//   final int cols = 3;
//   var IMAGE_PATH = 'image_path';
//   late File _image;
//   late String _imagePath;
//   late List<Widget> pieces = [];

//   bool _overlayVisible = true;

//   @override
//   void initState() {
//     super.initState();
//     initPrefs();
//   }

//   void initPrefs() async {
//     if (_imagePath != null) {
//       //print(_imagePath);
//       _image = File(_imagePath);
//       print(_image.path);
//     }

//     splitImage(Image.file(_image));

//     // restore importanat things
//   }

//   void savePrefs() async {
//     await prefs.setString(IMAGE_PATH, _imagePath);
//   }

//   Future getImage(ImageSource source) async {
//     var image = await ImagePicker.pickImage(source: source);

//     if (image != null) {
//       setState(() {
//         _image = image;
//         _imagePath = _image.path;
//         pieces.clear();
//         ScoreWidget.of(context).allInPlaceCount = 0;
//       });
//     }
//     splitImage(Image.file(image));
//     savePrefs();
//   }

//   // we need to find out the image size, to be used in the PuzzlePiece widget
//   Future<Size> getImageSize(Image image) async {
//     final Completer<Size> completer = Completer<Size>();

//     image.image
//         .resolve(const ImageConfiguration())
//         .addListener(ImageStreamListener((ImageInfo info, bool _) {
//       completer.complete(
//           Size(info.image.width.toDouble(), info.image.height.toDouble()));
//     }));

//     final Size imageSize = await completer.future;

//     return imageSize;
//   }

//   // here we will split the image into small pieces
//   // using the rows and columns defined above; each piece will be added to a stack
//   void splitImage(Image image) async {
//     Size imageSize = await getImageSize(image);

//     for (int x = 0; x < rows; x++) {
//       for (int y = 0; y < cols; y++) {
//         setState(() {
//           pieces.add(
//             PuzzlePiece(
//               key: GlobalKey(),
//               image: image,
//               imageSize: imageSize,
//               row: x,
//               col: y,
//               maxRow: rows,
//               maxCol: cols,
//               bringToTop: this.bringToTop,
//               sendToBack: this.sendToBack,
//             ),
//           );
//         });
//       }
//     }
//   }

//   // when the pan of a piece starts, we need to bring it to the front of the stack
//   void bringToTop(Widget widget) {
//     setState(() {
//       pieces.remove(widget);
//       pieces.add(widget);
//     });
//   }

// // when a piece reaches its final position,
// // it will be sent to the back of the stack to not get in the way of other, still movable, pieces
//   void sendToBack(Widget widget) {
//     setState(() {
//       pieces.remove(widget);
//       pieces.insert(0, widget);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     savePrefs();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Puzzle'),
//       ),
//       body: SafeArea(
//         child: _image == null
//             ? Center(child: Text('No image selected.'))
//             : ScoreWidget.of(context).allInPlaceCount == rows * cols
//                 ? Overlay(
//                     initialEntries: [
//                       OverlayEntry(builder: (context) {
//                         return CorrectOverlay(true, () {
//                           setState(() {
//                             ScoreWidget.of(context).allInPlaceCount = 0;
//                           });
//                         });
//                       })
//                     ],
//                   )
//                 : Stack(
//                     children: pieces,
//                   ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet<void>(
//               context: context,
//               builder: (BuildContext context) {
//                 return SafeArea(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       new ListTile(
//                         leading: new Icon(Icons.image),
//                         title: new Text('Gallery'),
//                         onTap: () {
//                           getImage(ImageSource.gallery);
//                           // dismiss the modal sheet
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               });
//         },
//         tooltip: 'New Image',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
