// ignore_for_file: unnecessary_new

class ResetRequest {
  String? otp;
  String? newPassword;

  ResetRequest({this.otp, this.newPassword});

  ResetRequest.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['newPassword'] = newPassword;
    return data;
  }
}
