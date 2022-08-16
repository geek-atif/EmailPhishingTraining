import '../screens/expandable_screen.dart';
import '../screens/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MyRouter {
  static var expandableScreen = "/expandableScreen";
  static var route = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: expandableScreen, page: () => const ExpandableScreen()),
  ];
}
