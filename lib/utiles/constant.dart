import 'package:flutter/material.dart';

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

// Game Details
const String GAME_WORD_TOTAL = "gameWordTotal";
const String GAME_WORD_ATTEMPT = "gameWordAttempt";
const String GAME_WORD_DONE = "gameWordDone";

//Quiz Details
const String QUIZ_PHISHING_TOTAL = "quizPhishingTotal";
const String QUIZ_PHISHING_ATTEMPT = "quizPhishingAttempt";
const String Quiz_PHISHING_DONE = "quizPhishingDone";

//Tutorial Details
const String TUTORIAL_OFFICE_TOTAL = "tutorialOfficeTotal";
const String TUTORIAL_OFFICE_ATTEMPT = "tutorialOfficeAttempt";
const String TUTORIAL_STEP_TOTAL = "tutorialStepTotal";
const String TUTORIAL_STEP_ATTEMPT = "tutorialStepAttempt";
const String TUTORIAL_STEP_ATTEMPT_Done = "tutorialStepAttemptDone";
