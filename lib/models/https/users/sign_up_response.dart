// class SignUpResponse {
//   bool? status;
//   Data? data;
//   String? message;

//   SignUpResponse({this.status, this.message, this.data});

//   SignUpResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ?  Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? token;

//   Data({this.firstName, this.lastName, this.email, this.token});

//   Data.fromJson(Map<String, dynamic> json) {
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     email = json['email'];
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['firstName'] = firstName;
//     data['lastName'] = lastName;
//     data['email'] = email;
//     data['token'] = token;
//     return data;
//   }
// }


class SignUpResponse {
  SignUpResponse({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });
  late final bool status;
  late final String message;
  late final User user;
  late final String token;
  
  SignUpResponse.fromJson(Map<String, dynamic> json){
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
    required this.isVerified,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.profileImg,
    required this.password,
    required this.packages,
    required this.deliveries,
    required this.hubs,
    required this.wallet,
    required this.joinDate,
    required this.banks,
    required this.cards,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
  late final String sId;
  late final bool isVerified;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String profileImg;
  late final String password;
  late final List<dynamic> packages;
  late final List<dynamic> deliveries;
  late final List<dynamic> hubs;
  late final int wallet;
  late final String joinDate;
  late final List<dynamic> banks;
  late final List<dynamic> cards;
  late final String createdAt;
  late final String updatedAt;
  late final int v;
  
  User.fromJson(Map<String, dynamic> json){
    sId = json['_id'];
    isVerified = json['isVerified'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    profileImg = json['profileImg'];
    password = json['password'];
    packages = List.castFrom<dynamic, dynamic>(json['packages']);
    deliveries = List.castFrom<dynamic, dynamic>(json['deliveries']);
    hubs = List.castFrom<dynamic, dynamic>(json['hubs']);
    wallet = json['wallet'];
    joinDate = json['joinDate'];
    banks = List.castFrom<dynamic, dynamic>(json['banks']);
    cards = List.castFrom<dynamic, dynamic>(json['cards']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = sId;
    _data['isVerified'] = isVerified;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['profileImg'] = profileImg;
    _data['password'] = password;
    _data['packages'] = packages;
    _data['deliveries'] = deliveries;
    _data['hubs'] = hubs;
    _data['wallet'] = wallet;
    _data['joinDate'] = joinDate;
    _data['banks'] = banks;
    _data['cards'] = cards;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = v;
    return _data;
  }
}