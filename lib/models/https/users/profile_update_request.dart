class ProfileUpdateRequest {
  String? email;
  String? lastName;
  String? firstName;
  String? phone;

  ProfileUpdateRequest({this.email, this.lastName, this.firstName, this.phone});

  ProfileUpdateRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['lastName'] = lastName;
    data['firstName'] = firstName;
    data['phone'] = phone;
    return data;
  }
}
