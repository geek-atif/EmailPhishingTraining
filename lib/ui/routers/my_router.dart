import '../../../ui/screens/auth/login_screen.dart';
import '../../ui/screens/splash_screen.dart';
import '../screens/games/crossword/cross_puzzle_screen.dart';
import '../screens/games/emailphishing/email_phishing_screen.dart';
import '../screens/games/role_play/role_play_sub_home_screen.dart';
import '../screens/games/role_play/role_play_sub_screen/bank_of_america_screen.dart';
import '../screens/games/role_play/role_play_sub_screen/emma_screen.dart';
import '../screens/games/role_play/role_play_sub_screen/mark_speckhardt_screen.dart';
import '../screens/games/role_play/role_play_sub_screen/paypal_screen.dart';
import '../screens/games/role_play/role_play_sub_screen/zoom_meeting_reminder_screen.dart';
import '../screens/games/role_play/role_play_sucess_screen.dart';
import '../screens/games/role_play/role_play_wrong_screen.dart';
import '../screens/games/word/word_game_screen.dart';
import '../screens/reports/main_report_screen.dart';
import '../screens/simple_login/simple_login_screen.dart';
import '../screens/test_screen.dart';
import '../screens/tutorial/office365/office_phishing_five_screen.dart';
import '../screens/tutorial/office365/office_phishing_four_screen.dart';
import '../screens/tutorial/office365/office_phishing_one.dart';
import '../screens/getting_started_screen.dart';
import '../screens/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screens/tutorial/office365/office_phishing_three_screen.dart';
import '../screens/tutorial/office365/office_phishing_two_screen.dart';
import '../screens/tutorial/phishingsteps/phishing_step_four.dart';
import '../screens/tutorial/phishingsteps/phishing_step_one.dart';
import '../screens/tutorial/phishingsteps/phishing_step_three.dart';
import '../screens/tutorial/phishingsteps/phishing_step_two.dart';
import '../screens/quiz/quiz_screen.dart';
import '../screens/quiz/score_screen.dart';
import '../screens/webview/my_web_view.dart';
import '../screens/debug_screen.dart';

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
  static var crossPuzzleScreen = "/crossPuzzleScreen";
  static var myWebView = "/myWebView";
  static var phishingStepFour = "/phishingStepFour";
  static var officePhishingFiveScreen = "/officePhishingFiveScreen";
  static var simpleLoginScreen = "/simpleLoginScreen";
  static var rolePlaySubHome = "/rolePlaySubHome";
  static var markSpeckhardtScreen = "/markSpeckhardtScreen";
  static var zoomMeetingReminderScreen = "/zoomMeetingReminderScreen";
  static var emmaScreen = "/emmaScreen";
  static var bankOfAmericaScreen = "/bankOfAmericaScreen";
  static var payPalScreen = "/payPalScreen";
  static var rolePlaySucessScreen = "/rolePlaySucessScreen";
  static var rolePlayWrongScreen = "/rolePlayWrongScreen";
  static var mainReportScreen = "/mainReportScreen";
  static var debugScreen = "/debugScreen";

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
    GetPage(name: crossPuzzleScreen, page: () => const CrossPuzzleScreen()),
    GetPage(name: phishingStepFour, page: () => const PhishingStepFour()),
    GetPage(
        name: officePhishingFiveScreen,
        page: () => const OfficePhishingFiveScreen()),
    GetPage(name: myWebView, page: () => const MyWebView()),
    GetPage(name: simpleLoginScreen, page: () => const SimpleLoginScreen()),
    GetPage(name: rolePlaySubHome, page: () => const RolePlaySubHomeScreen()),
    GetPage(name: markSpeckhardtScreen, page: () => MarkSpeckhardtScreen()),
    GetPage(
        name: zoomMeetingReminderScreen,
        page: () => ZoomMeetingReminderScreen()),
    GetPage(name: emmaScreen, page: () => EmmaScreen()),
    GetPage(name: bankOfAmericaScreen, page: () => BankOfAmericaScreen()),
    GetPage(name: payPalScreen, page: () => PayPalScreen()),
    GetPage(name: rolePlaySucessScreen, page: () => RolePlaySucessScreen()),
    GetPage(name: rolePlayWrongScreen, page: () => RolePlayWrongScreen()),
    GetPage(name: mainReportScreen, page: () => MainReportScreen()),
    GetPage(name: debugScreen, page: () => DebugScreen()),


  ];
}
