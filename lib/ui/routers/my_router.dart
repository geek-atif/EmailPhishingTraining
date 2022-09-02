import '../../../ui/screens/auth/login_screen.dart';
import '../../ui/screens/splash_screen.dart';
import '../screens/games/emailphishing/email_phishing_screen.dart';
import '../screens/games/word/word_game_screen.dart';
import '../screens/tutorial/office365/office_phishing_four_screen.dart';
import '../screens/tutorial/office365/office_phishing_one.dart';
import '../screens/getting_started_screen.dart';
import '../screens/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screens/tutorial/office365/office_phishing_three_screen.dart';
import '../screens/tutorial/office365/office_phishing_two_screen.dart';
import '../screens/tutorial/phishingsteps/phishing_step_one.dart';
import '../screens/tutorial/phishingsteps/phishing_step_three.dart';
import '../screens/tutorial/phishingsteps/phishing_step_two.dart';
import '../screens/quiz/quiz_screen.dart';
import '../screens/quiz/score_screen.dart';

class MyRouter {
  static var expandableScreen = "/expandableScreen";
  static var gettingStartedScreen = "/gettingStartedScreen";
  static var officePhishingOne = "/officePhishingOne";
  static var scoreScreen = "/scoreScreen";
  static var quizScreen = "/quizScreen";
  static var phishingStepOne = "/phishingStepOne";
  static var phishingStepTwo = "/phishingStepTwo";
  static var phishingStepThree = "/phishingStepThree";
  static var wordGameScreen = "/wordGameScreen";
  static var homeScreen = "/homeScreen";
  static var splashScreen = "/";
  static var loginScreen = "/loginScreen";
  static var officePhishingTwoScreen = "/officePhishingTwoScreen";
  static var officePhishingThreeScreen = "/officePhishingThreeScreen";
  static var officePhishingFourScreen = "/officePhishingFourScreen";
  static var emailPhishingScreen = "/emailPhishingScreen";

  static var route = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: gettingStartedScreen, page: () => GettingStartedScreen()),
    GetPage(name: officePhishingOne, page: () => const OfficePhishingOne()),
    GetPage(name: scoreScreen, page: () => ScoreScreen()),
    GetPage(name: quizScreen, page: () => QuizScreen()),
    GetPage(name: phishingStepOne, page: () => const PhishingStepOne()),
    GetPage(name: phishingStepTwo, page: () => const PhishingStepTwo()),
    GetPage(name: phishingStepThree, page: () => const PhishingStepThree()),
    GetPage(name: wordGameScreen, page: () => const WordGameScreen()),
    GetPage(
        name: officePhishingTwoScreen,
        page: () => const OfficePhishingTwoScreen()),
    GetPage(
        name: officePhishingThreeScreen,
        page: () => const OfficePhishingThreeScreen()),
    GetPage(
        name: officePhishingFourScreen,
        page: () => const OfficePhishingFourScreen()),
    GetPage(name: emailPhishingScreen, page: () => EmailPhishingScreen()),
  ];
}
