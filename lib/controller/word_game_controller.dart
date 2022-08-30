import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/word_game.dart';
import '../ui/routers/my_router.dart';

class WordGameController extends GetxController
    with SingleGetTickerProviderMixin {
  late List<WordGame> _wordGames;
  List<WordGame> get wordGames => _wordGames;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  late AnimationController _animationController;
  late Animation _animation;
  // so that we can access our animation outside
  Animation get animation => _animation;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  RxInt ansStatus = 0.obs;

  @override
  void onInit() {
    _pageController = PageController();

    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    //_animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    setWordGames("");
    super.onInit();
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

  void checkAns(String correctAns, String enterAns, int index) {
    print("checkAns() correctAns $correctAns enterAns $enterAns ");
    // because once user press any option then it will run
    // _isAnswered = true;

    _selectedAns = index;

    if (correctAns == enterAns) {
      _numOfCorrectAns++;
      ansStatus.value = 1;
    } else {
      ansStatus.value = 2;
    }

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    print("nextQuestion()  ");
    if (_questionNumber.value != _wordGames.length) {
      print("nextQuestion() if  ");
      //_isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      print("nextQuestion() else  ");
      // Get package provide us simple way to naviigate another page
      Get.offAndToNamed(MyRouter.homeScreen);
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
    ansStatus.value = 0;
  }
}
