import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threattraining/ui/routers/my_router.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import '../../../styles/images.dart';
import '../../button/dark_blue_button.dart';

class PhishingTwoDialog {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => true,
            child: SimpleDialog(
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
                      child: Image.asset(Images.phisingtwo),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.phishingStepThree),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Step 3"),
                  ),
                )
              ],
            ),
          );
        });
  }
}
