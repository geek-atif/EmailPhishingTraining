import 'package:flutter/material.dart';
import '../../../../controller/word_game_controller.dart';
import 'word_draggable_card.dart';

class WordGameList extends StatelessWidget {
  const WordGameList({Key? key, required this.wordGameController})
      : super(key: key);
  final WordGameController wordGameController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        // Block swipe to next qn
        physics: NeverScrollableScrollPhysics(),
        controller: wordGameController.pageController,
        //onPageChanged: _wordGameController.updateTheQnNum,
        itemCount: wordGameController.wordGames.length,
        itemBuilder: (context, index) => WordDraggableCard(
          index: index,
          wordGame: wordGameController.wordGames[index],
          wordGameController: wordGameController,
        ),
      ),
    );
  }
}
