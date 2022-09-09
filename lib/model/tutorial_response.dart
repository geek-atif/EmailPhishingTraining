class TutorialResponse {
  TutorialResponse({
    required this.errorStatus,
    required this.errorMessage,
  });
  late final bool errorStatus;
  late final String errorMessage;

  TutorialResponse.fromJson(Map<String, dynamic> json) {
    errorStatus = json['errorStatus'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['errorStatus'] = errorStatus;
    _data['errorMessage'] = errorMessage;
    return _data;
  }
}
