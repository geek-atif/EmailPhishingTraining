import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

import '../styles/images.dart';
import 'button/dark_blue_button.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              key: key,
              backgroundColor: Colors.transparent,
              children: <Widget>[
                Center(
                  child: PinchZoomImage(
                    image: Image.asset(Images.office1),
                    zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
                    hideStatusBarWhileZooming: true,
                    onZoomStart: () {
                      print('Zoom started');
                    },
                    onZoomEnd: () {
                      print('Zoom finished');
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  // onTap: () => Dialogs.showLoadingDialog(context, keyLoader),
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
