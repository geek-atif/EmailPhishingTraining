import '../../../controller/server_update_controller.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<ServerUpdateController>(
      () => ServerUpdateController(),
    );
  }
}
