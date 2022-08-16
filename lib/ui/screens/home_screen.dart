import 'dart:async';
import 'package:get/get.dart';
import 'package:threattraining/ui/routers/my_router.dart';

import '../../ui/widgets/button/dark_blue_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _startTime() async {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigationToWelcomeScreen);
  }

  void navigationToWelcomeScreen() {}

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
                child: InkWell(
                  onTap: () => Get.toNamed(MyRouter.expandableScreen),
                  child: DarkBlueButton(
                    buttonText: "Office 365 phishing",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
