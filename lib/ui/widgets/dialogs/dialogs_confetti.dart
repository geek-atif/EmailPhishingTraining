import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class MyDialogsConfetti {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    ConfettiController _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
    _confettiController.play();
    _confettiController.play();
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => true,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirectionality: BlastDirectionality.explosive,
                      emissionFrequency: 0.1,
                    ),
                  ),
                ],
              ));
        });
  }
}
