class Notifications {
  bool? status;
  String? message;
  List<User>? user;
  String? token;

  Notifications({this.status, this.message, this.user, this.token});

  Notifications.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['user'] != null) {
      user = [];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? sId;
  bool? hasRead;
  String? category;
  String? description;
  Owner? owner;
  int? iV;
  String? createdAt;
  String? updatedAt;

  User(
      {this.sId,
      this.hasRead,
      this.category,
      this.description,
      this.owner,
      this.iV,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hasRead = json['hasRead'];
    category = json['category'];
    description = json['description'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hasRead'] = this.hasRead;
    data['category'] = this.category;
    data['description'] = this.description;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Owner {
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

  double? wallet;
  String? joinDate;
  List<Banks>? banks;

  String? createdAt;
  String? updatedAt;
  int? iV;
  Request? request;
  List<String>? hubs;
  String? latitude;
  String? longitude;

  Owner(
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
      this.wallet,
      this.joinDate,
      this.banks,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.request,
      this.hubs,
      this.latitude,
      this.longitude});

  Owner.fromJson(Map<String, dynamic> json) {
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

    wallet = json['wallet'];
    joinDate = json['joinDate'];
    if (json['banks'] != null) {
      banks = [];
      json['banks'].forEach((v) {
        banks!.add(new Banks.fromJson(v));
      });
    }

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    request =
        json['request'] != null ? Request.fromJson(json['request']) : null;
    hubs = json['hubs'].cast<String>();
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    data['packages'] = this.packages;

    data['wallet'] = this.wallet;
    data['joinDate'] = this.joinDate;
    if (this.banks != null) {
      data['banks'] = this.banks!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.request != null) {
      data['request'] = this.request!.toJson();
    }
    data['hubs'] = this.hubs;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
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

class Request {
  String? fromState;
  String? fromTown;
  int? capacity;
  String? toState;
  String? toTown;
  String? travelTime;
  String? packageType;
  String? transportMode;

  Request(
      {this.fromState,
      this.fromTown,
      this.capacity,
      this.toState,
      this.toTown,
      this.travelTime,
      this.packageType,
      this.transportMode});

  Request.fromJson(Map<String, dynamic> json) {
    fromState = json['fromState'];
    fromTown = json['fromTown'];
    capacity = json['capacity'];
    toState = json['toState'];
    toTown = json['toTown'];
    travelTime = json['travelTime'];
    packageType = json['packageType'];
    transportMode = json['transportMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromState'] = this.fromState;
    data['fromTown'] = this.fromTown;
    data['capacity'] = this.capacity;
    data['toState'] = this.toState;
    data['toTown'] = this.toTown;
    data['travelTime'] = this.travelTime;
    data['packageType'] = this.packageType;
    data['transportMode'] = this.transportMode;
    return data;
  }
}
