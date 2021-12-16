// ignore_for_file: unnecessary_new

class UpdatePasswordRequest {
  String? oldPassword;
  String? newPassword;

  UpdatePasswordRequest({this.oldPassword, this.newPassword});

  UpdatePasswordRequest.fromJson(Map<String, dynamic> json) {
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oldPassword'] = oldPassword;
    data['newPassword'] = newPassword;
    return data;
  }
}
