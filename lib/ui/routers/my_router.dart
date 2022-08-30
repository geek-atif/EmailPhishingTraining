import '../../../ui/screens/auth/login_screen.dart';
import '../../ui/screens/splash_screen.dart';
import '../screens/games/word_game_screen.dart';
import '../screens/office_phishing.dart';
import '../screens/getting_started_screen.dart';
import '../screens/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screens/phishingsteps/phishing_step_one.dart';
import '../screens/phishingsteps/phishing_step_three.dart';
import '../screens/phishingsteps/phishing_step_two.dart';
import '../screens/quiz_screen.dart';
import '../screens/score_screen.dart';

class MyRouter {
  static var expandableScreen = "/expandableScreen";
  static var gettingStartedScreen = "/gettingStartedScreen";
  static var officePhishing = "/officePhishing";
  static var scoreScreen = "/scoreScreen";
  static var quizScreen = "/quizScreen";
  static var phishingStepOne = "/phishingStepOne";
  static var phishingStepTwo = "/phishingStepTwo";
  static var phishingStepThree = "/phishingStepThree";
  static var wordGameScreen = "/wordGameScreen";
  static var homeScreen = "/homeScreen";
  static var splashScreen = "/";
  static var loginScreen = "/loginScreen";

  static var route = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: gettingStartedScreen, page: () => GettingStartedScreen()),
    GetPage(name: officePhishing, page: () => const OfficePhishing()),
    GetPage(name: scoreScreen, page: () => ScoreScreen()),
    GetPage(name: quizScreen, page: () => QuizScreen()),
    GetPage(name: phishingStepOne, page: () => const PhishingStepOne()),
    GetPage(name: phishingStepTwo, page: () => const PhishingStepTwo()),
    GetPage(name: phishingStepThree, page: () => const PhishingStepThree()),
    GetPage(name: wordGameScreen, page: () => const WordGameScreen()),
  ];
}
