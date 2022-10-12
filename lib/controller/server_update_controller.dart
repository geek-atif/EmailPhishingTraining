import 'dart:developer';
import '../../../utiles/constant.dart';
import '../../../utiles/utility.dart';
import 'package:get/get.dart';
import '../api_base_helper/api_base_helper.dart';
import '../model/tutorial_response.dart';
import '../model/user_report.dart';
import '../ui/routers/my_router.dart';
import '../ui/screens/home_screen.dart';

class ServerUpdateController extends GetxController {
  var isLoading = false.obs;
  final ApiBaseHelper _helper = ApiBaseHelper();
  var userInfo = UserInfo(
          companyQuizReadiness: '',
          userName: '',
          userGroup: '',
          phishingReadiness: '',
          tutorialReadiness: '',
          score: 0,
          companyReadiness: '',
          tutorialTimeTaken: '',
          quizTimeTaken: '',
          phishingEmailRisk: [],
          quizReadiness: '',
          userid: '')
      .obs;

  List<ChartData> phishingReadinessUser =
      List<ChartData>.empty(growable: true).obs;
  List<ChartData> phishingReadinessCompany =
      List<ChartData>.empty(growable: true).obs;

  List<ChartData> quizReadinessUser = List<ChartData>.empty(growable: true).obs;
  List<ChartData> quizReadinessCompnay =
      List<ChartData>.empty(growable: true).obs;

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
    var otp = Utility.getTotp();
    print("updateQuiz otp ${otp} ");
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      "time_taken": Utility.getCurrentTime().toString(),
      "quiz_name": quizName.toString(),
      "score": quizScore.toString(),
      "otp": otp
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
    var otp = Utility.getTotp();
    print("updateTutorial otp ${otp} ");
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      "visited_time": Utility.getCurrentTime().toString(),
      "tutorial_name": tutorialName.toString(),
      "otp": otp
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

  getUserReport() async {
    isLoading.value = true;
    var otp = Utility.getTotp();
    print("getUserReport otp ${otp} ");
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      "otp": otp
    };

    try {
      final response = await _helper.post("user_report", body);
      log("response ${response}");
      UserReport userReport = UserReport.fromJson(response);
      isLoading.value = false;
      if (userReport.errorStatus) {
        userInfo.value = userReport.userInfo;
        phishingReadinessUser.add(
            ChartData("Game", double.parse(userInfo.value.phishingReadiness)));
        phishingReadinessCompany.add(
            ChartData("Game", double.parse(userInfo.value.companyReadiness)));

        quizReadinessUser
            .add(ChartData("Quiz", double.parse(userInfo.value.quizReadiness)));

        quizReadinessCompnay.add(ChartData(
            "Quiz", double.parse(userInfo.value.companyQuizReadiness)));
      } else {
        Utility.showInfo(userReport.errorMessage);
      }
    } catch (e) {
      Utility.showError("Failed To Update");
      e.printError();
      isLoading.value = false;
    }
  }
}
