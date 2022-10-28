import 'package:flutter/material.dart';

const baseUrl = "https://staging.whitehax.com/whlite/";
const simpleLoginBaseURL = "https://app.simplelogin.io/api";

String checkmarkJson = "assets/json/checkmark.json";
String ohNoJson = "assets/json/oh_no.json";

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Colors.white54, Colors.white70],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;

// User Details key
const String USER_LOGIN_STATUS = "userLoginStatus";
const String USER_NAME = "userName";
const String USER_EMAIL_ADDRESS = "userEmailAddress";
const String USER_ID = "userId";
const String USER_ADMIN_ID = "adminId";
const String USER_COMPANY_NAME = "userCompnayName";

// Game Details
const String GAME_TOTAL_PRE = "gameTotalPre";
const String GAME_TOTAL = "gameTotal";

const String GAME_WORD_TOTAL = "gameWordTotal";
const String GAME_WORD_ATTEMPT = "gameWordAttempt";
const String GAME_WORD_DONE = "gameWordDone";

const String GAME_ROLE_PLAY_TOTAL = "gameRolePlayTotal";
const String GAME_ROLE_PLAY_ATTEMPT = "gameRolePlayAttempt";
const String GAME_ROLE_PLAY_DONE = "gameRolePlayDone";

//Quiz Details
const String QUIZ_TOTAL_PRE = "quizTotalPre";
const String QUIZ_TOTAL = "quizTotal";

const String QUIZ_PHISHING_TOTAL = "quizPhishingTotal";
const String QUIZ_PHISHING_ATTEMPT = "quizPhishingAttempt";
const String Quiz_PHISHING_DONE = "quizPhishingDone";

//Tutorial Details
const String TUTORIAL_OFFICE_TOTAL = "tutorialOfficeTotal";
const String TUTORIAL_OFFICE_ATTEMPT = "tutorialOfficeAttempt";
const String TUTORIAL_OFFICE_DONE = "tutorialOfficeDone";

const String TUTORIAL_STEP_TOTAL = "tutorialStepTotal";
const String TUTORIAL_STEP_ATTEMPT = "tutorialStepAttempt";
const String TUTORIAL_STEP_ATTEMPT_Done = "tutorialStepAttemptDone";

const String TUTORIAL_PHISHING_FACT_Done = "phishingFactdone";

const String ROLE_PLAY_GAME1 = "rolePlayGame1";
const String ROLE_PLAY_GAME2 = "rolePlayGame2";
const String ROLE_PLAY_GAME3 = "rolePlayGame3";
const String ROLE_PLAY_GAME4 = "rolePlayGame4";
const String ROLE_PLAY_GAME5 = "rolePlayGame5";

//Get Storage
//const String LOGIN_CONTAINER = "loginContainer";
