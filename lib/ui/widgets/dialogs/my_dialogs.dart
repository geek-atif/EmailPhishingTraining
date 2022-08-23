import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threattraining/ui/routers/my_router.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import '../../../model/questions.dart';
import '../../styles/images.dart';
import '../button/dark_blue_button.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => true,
            child: SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              key: key,
              backgroundColor: Colors.transparent,
              //backgroundColor: MyAppTheme.grey100,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ZoomOverlay(
                      minScale: 0.5, // Optional
                      maxScale: 3.0, // Optional
                      twoTouchOnly: true, // Defaults to false
                      child: Image.asset(Images.office1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => Get.offAndToNamed(MyRouter.quizScreen,
                      arguments: "office365Qus"),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Quiz Time"),
                  ),
                )
              ],
            ),
          );
        });
  }
}
