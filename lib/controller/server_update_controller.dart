import 'dart:developer';
import '../../../utiles/constant.dart';
import '../../../utiles/utility.dart';
import 'package:get/get.dart';
import '../api_base_helper/api_base_helper.dart';
import '../model/tutorial_response.dart';
import '../model/user_report.dart';
import '../model/get_game_id.dart';
import '../ui/routers/my_router.dart';
import '../ui/screens/home_screen.dart';

class ServerUpdateController extends GetxController {
  var isLoadingGame = false.obs;
  var isLoading = false.obs;
  var isLoading_ = false.obs;
  var gameId = 0.obs;
  final ApiBaseHelper _helper = ApiBaseHelper();
  var userInfo = UserInfo(
          companyQuizReadiness: '',
          userName: '',
          userGroup: '',
          phishingReadiness: '',
          tutorialReadiness: '',
          score: 0,
          companyReadiness: '',
          tutorialTimeTaken: 0,
          quizTimeTaken: 0,
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
    var otp = await Utility.getTotp();
    print("updateQuiz otp ${otp} ");
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      "time_taken": Utility.getCurrentTime().toString(),
      "quiz_name": quizName.toString(),
      "score": quizScore.toString(),
      "otp": otp,
      'source': Utility.getOS()
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
      Utility.showError("Something went wrong");
      e.printError();
      isLoading.value = false;
    }
  }

  updateTutorial(var tutorialName) async {
    isLoading.value = true;
    var otp = await Utility.getTotp();
    print("updateTutorial otp ${otp} ");
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      "visited_time": Utility.getCurrentTime().toString(),
      "tutorial_name": tutorialName.toString(),
      "otp": otp,
      'source': Utility.getOS()
    };

    try {
      final response = await _helper.post("tutorialinfo", body);
      log("response ${response}");
      TutorialResponse userLogin = TutorialResponse.fromJson(response);
      isLoading.value = false;
      if (!userLogin.errorStatus) {
        if (tutorialName == "365Doc") {
          Get.toNamed(MyRouter.quizScreen, arguments: "office365Qus");
          Utility.saveBolValue(TUTORIAL_OFFICE_DONE, true);
        } else {
          Get.offAndToNamed(MyRouter.homeScreen);
        }
      } else {
        Utility.showInfo(userLogin.errorMessage);
      }
    } catch (e) {
      Utility.showError("Something went wrong");
      e.printError();
      isLoading.value = false;
    }
  }

  getUserReport() async {
    isLoading.value = true;
    var otp = await Utility.getTotp();
    print("getUserReport otp ${otp} ");
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      "otp": otp,
      'source': Utility.getOS()
    };

    try {
      final response = await _helper.post("user_report", body);
      log("response ${response}");
      UserReport userReport = UserReport.fromJson(response);
      isLoading.value = false;
      if (!userReport.errorStatus) {
        userInfo.value = userReport.userInfo;

        if (userInfo.value.phishingReadiness?.isNotEmpty ?? true) {
          phishingReadinessUser.add(ChartData(
              "Game", double.parse(userInfo.value.phishingReadiness)));
        } else {
          phishingReadinessUser.add(ChartData("Game", 0.0));
        }

        if (userInfo.value.companyReadiness?.isNotEmpty ?? true) {
          phishingReadinessCompany.add(
              ChartData("Game", double.parse(userInfo.value.companyReadiness)));
        } else {
          phishingReadinessCompany.add(ChartData("Game", 0.0));
        }

        if (userInfo.value.quizReadiness?.isNotEmpty ?? true) {
          quizReadinessUser.add(
              ChartData("Quiz", double.parse(userInfo.value.quizReadiness)));
        } else {
          quizReadinessUser.add(ChartData("Quiz", 0.0));
        }

        if (userInfo.value.companyQuizReadiness?.isNotEmpty ?? true) {
          quizReadinessCompnay.add(ChartData(
              "Quiz", double.parse(userInfo.value.companyQuizReadiness)));
        } else {
          quizReadinessCompnay.add(ChartData("Quiz", 0.0));
        }
      } else {
        Utility.showInfo(userReport.errorMessage);
      }
    } catch (e) {
      Utility.showError("Something went wrong");
      e.printError();
      isLoading.value = false;
    }
  }

  getUserReport_() async {
    isLoading_.value = true;
    var otp = await Utility.getTotp();
    print("getUserReport otp ${otp} ");
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      "otp": otp,
      'source': Utility.getOS()
    };

    try {
      final response = await _helper.post("user_report", body);
      log("response ${response}");
      UserReport userReport = UserReport.fromJson(response);
      isLoading_.value = false;
      if (!userReport.errorStatus) {
        userInfo.value = userReport.userInfo;

        if (userInfo.value.phishingReadiness?.isNotEmpty ?? true) {
          phishingReadinessUser.add(ChartData(
              "Game", double.parse(userInfo.value.phishingReadiness)));
        } else {
          phishingReadinessUser.add(ChartData("Game", 0.0));
        }

        if (userInfo.value.companyReadiness?.isNotEmpty ?? true) {
          phishingReadinessCompany.add(
              ChartData("Game", double.parse(userInfo.value.companyReadiness)));
        } else {
          phishingReadinessCompany.add(ChartData("Game", 0.0));
        }

        if (userInfo.value.quizReadiness?.isNotEmpty ?? true) {
          quizReadinessUser.add(
              ChartData("Quiz", double.parse(userInfo.value.quizReadiness)));
        } else {
          quizReadinessUser.add(ChartData("Quiz", 0.0));
        }

        if (userInfo.value.companyQuizReadiness?.isNotEmpty ?? true) {
          quizReadinessCompnay.add(ChartData(
              "Quiz", double.parse(userInfo.value.companyQuizReadiness)));
        } else {
          quizReadinessCompnay.add(ChartData("Quiz", 0.0));
        }
      } else {
        Utility.showInfo(userReport.errorMessage);
      }
    } catch (e) {
      Utility.showError("Something went wrong");
      e.printError();
      isLoading_.value = false;
    }
  }

  updateGame(var gameName, var gameScore) async {
    isLoading_.value = true;
    var otp = await Utility.getTotp();
    var gameID = await getGameID(gameName);
    print("updateGame otp ${otp} getGameID ${getGameID} ");
    dynamic body = {
      // "user_id": Utility.getIntValue(USER_ID).toString(),
      //"admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      //"time_taken": Utility.getCurrentTime().toString(),
      //"game_name": gameName.toString(),
      "id": gameID.toString(),
      "score": gameScore.toString(),
      "otp": otp,
      'source': Utility.getOS()
    };

    try {
      final response = await _helper.post("submitgame", body);
      log("response ${response}");
      TutorialResponse userLogin = TutorialResponse.fromJson(response);
      isLoading_.value = false;
      if (!userLogin.errorStatus) {
        Get.offAndToNamed(MyRouter.homeScreen);
      } else {
        Utility.showInfo(userLogin.errorMessage);
      }
    } catch (e) {
      Utility.showError("Something went wrong");
      e.printError();
      isLoading_.value = false;
    }
  }

  getGameID(var gameName) async {
    isLoadingGame.value = true;
    int id = 0;
    var otp = await Utility.getTotp();
    print("updateGame otp ${otp} ");
    dynamic body = {
      "user_id": Utility.getIntValue(USER_ID).toString(),
      "admin_id": Utility.getIntValue(USER_ADMIN_ID).toString(),
      //"time_taken": Utility.getCurrentTime().toString(),
      "game_name": gameName.toString(),
      "otp": otp,
      'source': Utility.getOS()
    };

    try {
      final response = await _helper.post("getgameid", body);
      log("response ${response}");
      GetGameID getGameID = GetGameID.fromJson(response);
      isLoadingGame.value = false;
      if (!getGameID.errorStatus) {
        id = getGameID.id;
        gameId.value = getGameID.id;
      } else {
        Utility.showInfo(getGameID.errorMessage);
      }
    } catch (e) {
      isLoadingGame.value = false;
      Utility.showError("Something went wrong");
      e.printError();
    }
    return id;
  }
}
