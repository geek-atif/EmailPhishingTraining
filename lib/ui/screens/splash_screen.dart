import '../../../ui/widgets/text/light_text_head.dart';
import '../../ui/styles/my_app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import '../../utiles/utility.dart';
import '../routers/my_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationToWelcomeScreen);
  }

  void navigationToWelcomeScreen() {
    try {
      var _isLogin = Utility.isLoginRequired();
      print("SplashScreen  _isLogin : ${_isLogin}");
      if (_isLogin != null) {
        if (_isLogin) {
          Get.toNamed(MyRouter.homeScreen);
        } else {
          Get.toNamed(MyRouter.loginScreen);
        }
      } else {
        Get.toNamed(MyRouter.loginScreen);
      }
    } on Exception catch (e) {
      e.printError();
      Get.toNamed(MyRouter.loginScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'WH ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'P',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 32),
                      ),
                      TextSpan(
                        text: 'hish',
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text: 'S',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 32),
                      ),
                      TextSpan(
                        text: 'im',
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
