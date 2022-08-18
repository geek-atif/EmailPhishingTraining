import '../screens/office_phishing.dart';
import '../screens/getting_started_screen.dart';
import '../screens/expandable_screen.dart';
import '../screens/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MyRouter {
  static var expandableScreen = "/expandableScreen";
  static var gettingStartedScreen = "/gettingStartedScreen";
  static var officePhishing = "/officePhishing";

  static var route = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: expandableScreen, page: () => const ExpandableScreen()),
    GetPage(name: gettingStartedScreen, page: () => GettingStartedScreen()),
    GetPage(name: officePhishing, page: () => const OfficePhishing()),
  ];
}
