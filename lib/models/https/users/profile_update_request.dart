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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['lastName'] = this.lastName;
    data['firstName'] = this.firstName;
    data['phone'] = this.phone;
    return data;
  }
}
