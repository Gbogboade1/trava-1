class PasswordResponse {
  PasswordResponse({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });
  late final bool status;
  late final String message;
  late final User user;
  late final String token;
  
  PasswordResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['user'] = user.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.sId,
    required this.email,
    required this.password,
    required this.phone,
    required this.firstName,
    required this.lastName,
  });
  late final String sId;
  late final String email;
  late final String password;
  late final String phone;
  late final String firstName;
  late final String lastName;
  
  User.fromJson(Map<String, dynamic> json){
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = sId;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    return _data;
  }
}