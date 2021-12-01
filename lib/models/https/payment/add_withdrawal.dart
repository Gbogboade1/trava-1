class AddWithdrawalResponse {
  bool? status;
  String? message;
  User? user;
  String? token;

  AddWithdrawalResponse({this.status, this.message, this.user, this.token});

  AddWithdrawalResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? sId;
  bool? isVerified;
  String? method;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? profileImg;
  List<dynamic>? packages;
  List<dynamic>? deliveries;
  String? joinDate;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? otp;
  String? otpTime;
  List<Banks>? banks;
  List<dynamic>? cards;

  User(
      {this.sId,
      this.isVerified,
      this.method,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.profileImg,
      this.password,
      this.packages,
      this.deliveries,
      this.joinDate,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.otp,
      this.otpTime,
      this.banks,
      this.cards});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isVerified = json['isVerified'];
    method = json['method'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    profileImg = json['profileImg'];
    password = json['password'];
    if (json['packages'] != null) {
      packages = [];
      json['packages'].forEach((v) {
        packages!.add((v));
      });
    }
    if (json['deliveries'] != null) {
      deliveries = [];
      json['deliveries'].forEach((v) {
        deliveries!.add((v));
      });
    }
    joinDate = json['joinDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
    otpTime = json['otpTime'];
    if (json['banks'] != null) {
      banks =[];
      json['banks'].forEach((v) {
        banks!.add(Banks.fromJson(v));
      });
    }
    if (json['cards'] != null) {
      cards = [];
      json['cards'].forEach((v) {
        cards!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['isVerified'] = isVerified;
    data['method'] = method;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['profileImg'] = profileImg;
    data['password'] = password;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v).toList();
    }
    if (deliveries != null) {
      data['deliveries'] = deliveries!.map((v) => v).toList();
    }
    data['joinDate'] = joinDate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['otp'] = otp;
    data['otpTime'] = otpTime;
    if (banks != null) {
      data['banks'] = banks!.map((v) => v.toJson()).toList();
    }
    if (cards != null) {
      data['cards'] = cards!.map((v) => v).toList();
    }
    return data;
  }
}

class Banks {
  String? bankId;
  String? accountNumber;
  String? accountName;
  String? bankName;
  String? sId;

  Banks(
      {this.bankId,
      this.accountNumber,
      this.accountName,
      this.bankName,
      this.sId});

  Banks.fromJson(Map<String, dynamic> json) {
    bankId = json['bankId'];
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    bankName = json['bankName'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bankId'] = bankId;
    data['accountNumber'] = accountNumber;
    data['accountName'] = accountName;
    data['bankName'] = bankName;
    data['_id'] = sId;
    return data;
  }
}
