import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/word_game.dart';

class WordGameController extends GetxController {
  late List<WordGame> _wordGames;
  List<WordGame> get wordGames => _wordGames;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
    setWordGames("");
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  void setWordGames(typeOfQuiz) {
    print("setQuestion typeOfQuiz ${typeOfQuiz}");

    _wordGames = WordGame.wordGameOne
        .map(
          (wordGame) => WordGame(
              id: wordGame['id'],
              question: wordGame['question'],
              answer: wordGame['answer']),
        )
        .toList();
  }
}
