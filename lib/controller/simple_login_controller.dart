import 'dart:developer';
import 'package:get/get.dart';
import '../api_base_helper/api_base_helper.dart';
import '../model/all_aliases.dart';
import '../utiles/utility.dart';

class SimpleLoginController extends GetxController {
  var isLoading = false.obs;
  final ApiBaseHelper _helper = ApiBaseHelper();

  var aliases = List<Aliases>.empty().obs;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    super.onInit();
  }

  getAllAliasese() async {
    isLoading.value = true;
    try {
      final response = await _helper.getSimpleLogin("/v2/aliases?page_id=0");
      log("response ${response}");
      isLoading.value = false;
      if (response.toString().contains("error")) {
        Utility.showError(response);
      } else {
        log(" else ");
        AllAliases allAliases = AllAliases.fromJson(response);
        aliases.value = allAliases.aliases;
        log(" else  ${aliases.first}");
      }
    } catch (e) {
      Utility.showError("error ");
      e.printError();
      isLoading.value = false;
    }
  }
}
