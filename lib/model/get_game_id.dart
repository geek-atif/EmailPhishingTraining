class GetGameID {
  GetGameID({
    required this.errorStatus,
    required this.errorMessage,
    required this.id,
  });
  late final bool errorStatus;
  late final String errorMessage;
  late final int id;

  GetGameID.fromJson(Map<String, dynamic> json) {
    errorStatus = json['errorStatus'];
    errorMessage = json['errorMessage'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['errorStatus'] = errorStatus;
    _data['errorMessage'] = errorMessage;
    _data['id'] = id;
    return _data;
  }
}
