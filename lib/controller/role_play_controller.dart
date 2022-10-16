import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../ui/routers/my_router.dart';
// We use get package for our state management

class RolePlayController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  late AnimationController _animationController;
  late Animation _animation;
  // so that we can access our animation outside
  Animation get animation => _animation;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: const Duration(seconds: 15), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
  }

  void nextQuestion() {
    print(" RolePlayController nextQuestion()");
    // Reset the counter
    _animationController.reset();

    // Then start it again
    // Once timer is finish go to the next qn
    _animationController.forward().whenComplete(nextQuestion);

    Get.toNamed(MyRouter.rolePlayWrongScreen);
  }
}
