import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../controller/word_game_controller.dart';
import '../../../../ui/widgets/my_app_bar.dart';
import '../../../../utiles/constant.dart';
import '../../../styles/fonts.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/games/wordgame/word_draggable_card.dart';
import '../../../widgets/games/wordgame/word_game_list.dart';

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
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${_wordGameController.questionNumber.value}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: Fonts.poppins,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: "/${_wordGameController.wordGames.length}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: Fonts.poppins,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1, color: Colors.white),
              const SizedBox(height: 5),
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
