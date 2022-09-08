class LoginResponse {
  LoginResponse({
    required this.userId,
    required this.adminId,
    required this.errorStatus,
    required this.errorMessage,
  });
  late final int userId;
  late final int adminId;
  late final bool errorStatus;
  late final String errorMessage;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    adminId = json['admin_id'];
    errorStatus = json['errorStatus'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['admin_id'] = adminId;
    _data['errorStatus'] = errorStatus;
    _data['errorMessage'] = errorMessage;
    return _data;
  }
}
