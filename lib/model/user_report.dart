class UserReport {
  UserReport({
    required this.errorStatus,
    required this.errorMessage,
    required this.userInfo,
  });
  late final bool errorStatus;
  late final String errorMessage;
  late final UserInfo userInfo;

  UserReport.fromJson(Map<String, dynamic> json) {
    errorStatus = json['errorStatus'];
    errorMessage = json['errorMessage'];
    userInfo = UserInfo.fromJson(json['user_info']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['errorStatus'] = errorStatus;
    _data['errorMessage'] = errorMessage;
    _data['user_info'] = userInfo.toJson();
    return _data;
  }
}

class UserInfo {
  UserInfo({
    required this.userid,
    required this.userName,
    required this.userGroup,
    required this.phishingReadiness,
    required this.tutorialReadiness,
    required this.quizReadiness,
    required this.score,
    required this.companyReadiness,
    required this.tutorialTimeTaken,
    required this.quizTimeTaken,
    required this.companyQuizReadiness,
    required this.phishingEmailRisk,
  });
  late final String userid;
  late final String userName;
  late final String userGroup;
  late final String phishingReadiness;
  late final String tutorialReadiness;
  late final String quizReadiness;
  late final int score;
  late final String companyReadiness;
  late final int tutorialTimeTaken;
  late final int quizTimeTaken;
  late final String companyQuizReadiness;
  List<PhishingEmailRisk> phishingEmailRisk = [];

  UserInfo.fromJson(Map<String, dynamic> json) {
    userid = json['userid'] ?? "";
    userName = json['user_name'] ?? "";
    userGroup = json['user_group'] ?? "";
    phishingReadiness = json['phishing_readiness'] ?? "";
    tutorialReadiness = json['tutorial_readiness'] ?? "";
    quizReadiness = json['quiz_readiness'] ?? "";
    score = json['score'] ?? "";
    companyReadiness = json['company_readiness'] ?? "";
    tutorialTimeTaken = json['tutorial_time_taken'] ?? "";
    quizTimeTaken = json['quiz_time_taken'] ?? "";
    companyQuizReadiness = json['company_quiz_readiness'] ?? "";
    json['phishing_email_risk'] = List.from(json['phishing_email_risk'])
        .map((e) => PhishingEmailRisk.fromJson(e))
        .toList();
    // if (json['phishing_email_risk'] == null) {
    //   phishingEmailRisk = [];
    // } else {
    //   List.from(json['phishing_email_risk'])
    //       .map((e) => PhishingEmailRisk.fromJson(e))
    //       .toList();
    // }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userid'] = userid;
    _data['user_name'] = userName;
    _data['user_group'] = userGroup;
    _data['phishing_readiness'] = phishingReadiness;
    _data['tutorial_readiness'] = tutorialReadiness;
    _data['quiz_readiness'] = quizReadiness;
    _data['score'] = score;
    _data['company_readiness'] = companyReadiness;
    _data['tutorial_time_taken'] = tutorialTimeTaken;
    _data['quiz_time_taken'] = quizTimeTaken;
    _data['company_quiz_readiness'] = companyQuizReadiness;
    _data['phishing_email_risk'] =
        phishingEmailRisk?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PhishingEmailRisk {
  PhishingEmailRisk({
    required this.name,
    required this.totalEmailSend,
    required this.totalEmailVisited,
    required this.dataEntered,
  });
  late final String name;
  late final int totalEmailSend;
  late final int totalEmailVisited;
  late final int dataEntered;

  PhishingEmailRisk.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    totalEmailSend = json['total_email_send'];
    totalEmailVisited = json['total_email_visited'];
    dataEntered = json['data_entered'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['total_email_send'] = totalEmailSend;
    _data['total_email_visited'] = totalEmailVisited;
    _data['data_entered'] = dataEntered;
    return _data;
  }
}
