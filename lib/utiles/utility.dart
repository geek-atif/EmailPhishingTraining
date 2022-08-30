import 'package:get_storage/get_storage.dart';
import 'constant.dart';

class Utility {
  static bool isLoginRequired() {
    final getStorage = GetStorage();
    return getStorage.hasData(USER_LOGIN_STATUS)
        ? getStorage.read(USER_LOGIN_STATUS)
        : false;
  }

  static saveLoginDetail(String userName, String emailAddress) {
    final getStorage = GetStorage();
    getStorage.write(USER_LOGIN_STATUS, true);
    getStorage.write(USER_EMAIL_ADDRESS, emailAddress);
    getStorage.write(USER_NAME, userName);
  }

  static String getUserName() {
    final getStorage = GetStorage();
    return getStorage.hasData(USER_NAME) ? getStorage.read(USER_NAME) : "";
  }

  static String getEmailAddress() {
    final getStorage = GetStorage();
    return getStorage.hasData(USER_EMAIL_ADDRESS)
        ? getStorage.read(USER_EMAIL_ADDRESS)
        : "";
  }
}
