class ResetRequest {
  String? otp;
  String? newPassword;

  ResetRequest({this.otp, this.newPassword});

  ResetRequest.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['newPassword'] = this.newPassword;
    return data;
  }
}
