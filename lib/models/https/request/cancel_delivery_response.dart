class CancelDeliveryResponse {
  bool? status;
  String? message;
  Data? data;
  String? token;

  CancelDeliveryResponse({this.status, this.message, this.data, this.token});

  CancelDeliveryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Data {
  String? sId;
  bool? isVerified;
  String? method;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? profileImg;
  String? password;
  List<String>? packages;
  List? deliveries;
  num? wallet;
  String? joinDate;
  List? banks;
  List? cards;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
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
      this.wallet,
      this.joinDate,
      this.banks,
      this.cards,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isVerified = json['isVerified'];
    method = json['method'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    profileImg = json['profileImg'];
    password = json['password'];
    packages = json['packages'].cast<String>();
    if (json['deliveries'] != null) {
      deliveries = [];
      json['deliveries'].forEach((v) {
        deliveries!.add((v));
      });
    }
    wallet = json['wallet'];
    joinDate = json['joinDate'];
    if (json['banks'] != null) {
      banks = [];
      json['banks'].forEach((v) {
        banks!.add((v));
      });
    }
    if (json['cards'] != null) {
      cards = [];
      json['cards'].forEach((v) {
        cards!.add((v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    data['packages'] = packages;
    if (deliveries != null) {
      data['deliveries'] = deliveries!.map((v) => v.toJson()).toList();
    }
    data['wallet'] = wallet;
    data['joinDate'] = joinDate;
    if (banks != null) {
      data['banks'] = banks!.map((v) => v.toJson()).toList();
    }
    if (cards != null) {
      data['cards'] = cards!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
