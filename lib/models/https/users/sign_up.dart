class SignUpRequest {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? password;

  SignUpRequest(
      {this.firstName, this.lastName, this.phone, this.email, this.password});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
