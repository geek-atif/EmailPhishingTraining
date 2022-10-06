import 'dart:developer';
import 'package:get/get.dart';
import '../../../utiles/utility.dart';
import '../api_base_helper/api_base_helper.dart';
import '../model/login_response.dart';

class AuthController extends GetxController {
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

  login(String userName, String emailAddress, String companyName) async {
    print("login  userName ${userName}  emailAddress ${emailAddress}");
    isLoading.value = true;
    dynamic body = {
      'user_mail': emailAddress.trim(),
      'company_name': companyName.trim()
    };

    try {
      final response = await _helper.post("getuserid", body);
      log("response ${response}");
      LoginResponse userLogin = LoginResponse.fromJson(response);
      isLoading.value = false;
      if (!userLogin.errorStatus) {
        Utility.saveloginData(userLogin, userName, emailAddress, companyName);
      } else {
        Utility.showError(userLogin.errorMessage);
      }
    } catch (e) {
      Utility.showError("Login Failed");
      e.printError();
      isLoading.value = false;
    }
  }
}
