import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:threattraining/utiles/utility.dart';
import '../model/questions.dart';
import '../ui/routers/my_router.dart';

class AuthController extends GetxController {
  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
  }

  login(String userName, String emailAddress) {
    print("login  userName ${userName}  emailAddress ${emailAddress}");
    Utility.saveLoginDetail(userName, emailAddress);
    Get.offAndToNamed(MyRouter.homeScreen);
  }
}
