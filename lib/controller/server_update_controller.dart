import 'dart:developer';
import '../../../utiles/constant.dart';
import '../../../utiles/utility.dart';
import 'package:get/get.dart';
import '../api_base_helper/api_base_helper.dart';
import '../model/tutorial_response.dart';
import '../ui/routers/my_router.dart';

class ServerUpdateController extends GetxController {
  var isLoading = false.obs;
  final ApiBaseHelper _helper = ApiBaseHelper();
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

  updateQuiz(var quizName, var quizScore) async {
    isLoading.value = true;
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      "time_taken": Utility.getCurrentTime().toString(),
      "quiz_name": quizName.toString(),
      "score": quizScore.toString()
    };

    try {
      final response = await _helper.post("submitquiz", body);
      log("response ${response}");
      TutorialResponse userLogin = TutorialResponse.fromJson(response);
      isLoading.value = false;
      if (!userLogin.errorStatus) {
        Get.offAndToNamed(MyRouter.homeScreen);
      } else {
        Utility.showInfo(userLogin.errorMessage);
      }
    } catch (e) {
      Utility.showError("Failed To Update");
      e.printError();
      isLoading.value = false;
    }
  }

  updateTutorial(var tutorialName) async {
    isLoading.value = true;
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      "visited_time": Utility.getCurrentTime().toString(),
      "tutorial_name": tutorialName.toString()
    };

    try {
      final response = await _helper.post("tutorialinfo", body);
      log("response ${response}");
      TutorialResponse userLogin = TutorialResponse.fromJson(response);
      isLoading.value = false;
      if (!userLogin.errorStatus) {
        if (tutorialName == "365Doc") {
          Get.toNamed(MyRouter.quizScreen, arguments: "phishingQuiz");
          Utility.saveBolValue(TUTORIAL_OFFICE_DONE, true);
        } else {
          Get.offAndToNamed(MyRouter.homeScreen);
        }
      } else {
        Utility.showInfo(userLogin.errorMessage);
      }
    } catch (e) {
      Utility.showError("Failed To Update");
      e.printError();
      isLoading.value = false;
    }
  }
}
