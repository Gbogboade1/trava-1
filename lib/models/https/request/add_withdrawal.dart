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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
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
  List<Null>? packages;
  List<Null>? deliveries;
  String? joinDate;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? otp;
  String? otpTime;
  List<Banks>? banks;
  List<Null>? cards;

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
        banks!.add(new Banks.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isVerified'] = this.isVerified;
    data['method'] = this.method;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['profileImg'] = this.profileImg;
    data['password'] = this.password;
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v).toList();
    }
    if (this.deliveries != null) {
      data['deliveries'] = this.deliveries!.map((v) => v).toList();
    }
    data['joinDate'] = this.joinDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['otp'] = this.otp;
    data['otpTime'] = this.otpTime;
    if (this.banks != null) {
      data['banks'] = this.banks!.map((v) => v.toJson()).toList();
    }
    if (this.cards != null) {
      data['cards'] = this.cards!.map((v) => v).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankId'] = this.bankId;
    data['accountNumber'] = this.accountNumber;
    data['accountName'] = this.accountName;
    data['bankName'] = this.bankName;
    data['_id'] = this.sId;
    return data;
  }
}
