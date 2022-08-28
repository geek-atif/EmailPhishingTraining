import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:threattraining/controller/word_game_controller.dart';
import 'package:threattraining/ui/widgets/my_app_bar.dart';
import '../../styles/my_app_theme.dart';
import '../../widgets/games/wordgame/word_draggable_card.dart';
import '../../widgets/games/wordgame/word_game_list.dart';

class WordGameScreen extends StatefulWidget {
  const WordGameScreen({Key? key}) : super(key: key);

  @override
  State<WordGameScreen> createState() => _WordGameScreenState();
}

class _WordGameScreenState extends State<WordGameScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final WordGameController _wordGameController = Get.put(WordGameController());

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    _controller = AnimationController(vsync: this);
    _wordGameController.setWordGames("");
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        appBar: const MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              const SizedBox(height: 20),
              WordGameList(
                wordGameController: _wordGameController,
              ),
            ],
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.all(8),
        //   child: SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       children: <Widget>[
        //         const SizedBox(height: 20),
        //         ...List.generate(
        //           _wordGameController.wordGames.length,
        //           (index) => WordGameList(
        //             index: index,
        //             wordGame: _wordGameController.wordGames[index],
        //             wordGameController: _wordGameController,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
