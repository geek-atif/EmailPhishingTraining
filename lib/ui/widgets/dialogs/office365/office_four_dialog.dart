import '../../../../controller/server_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../ui/routers/my_router.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import '../../../styles/images.dart';
import '../../../styles/my_app_theme.dart';
import '../../button/dark_blue_button.dart';
import '../../loading.dart';

class OfficeFourDialog {
  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key,
      ServerUpdateController serverUpdateController) async {
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
              //backgroundColor: Colors.transparent,
              backgroundColor: MyAppTheme.whitehaxdialog,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ZoomOverlay(
                      minScale: 0.5, // Optional
                      maxScale: 3.0, // Optional
                      twoTouchOnly: true, // Defaults to false
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(Images.sharedoc)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Obx(
                  () => serverUpdateController.isLoading.value
                      ? const Loading(
                          loadingMessage: '',
                        )
                      : InkWell(
                          onTap: () =>
                              serverUpdateController.updateTutorial("365Doc"),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: DarkBlueButton(buttonText: "Quiz Time !"),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () => Get.toNamed(
                    MyRouter.officePhishingOne,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Start Again !"),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
