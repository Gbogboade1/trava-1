class Notifications {
  bool? status;
  String? message;
  List<User>? user;
  String? token;

  Notifications({status, message, user, token});

  Notifications.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['user'] != null) {
      user = [];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
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
      {sId,
      hasRead,
      category,
      description,
      owner,
      iV,
      createdAt,
      updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hasRead = json['hasRead'];
    category = json['category'];
    description = json['description'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['hasRead'] = hasRead;
    data['category'] = category;
    data['description'] = description;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
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

  num? wallet;
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
      {sId,
      isVerified,
      method,
      firstName,
      lastName,
      email,
      phone,
      profileImg,
      password,
      packages,
      wallet,
      joinDate,
      banks,
      createdAt,
      updatedAt,
      iV,
      request,
      hubs,
      latitude,
      longitude});

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
        banks!.add(Banks.fromJson(v));
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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

    data['wallet'] = wallet;
    data['joinDate'] = joinDate;
    if (banks != null) {
      data['banks'] = banks!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (request != null) {
      data['request'] = request!.toJson();
    }
    data['hubs'] = hubs;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
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
      {bankId,
      accountNumber,
      accountName,
      bankName,
      sId});

  Banks.fromJson(Map<String, dynamic> json) {
    bankId = json['bankId'];
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    bankName = json['bankName'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['bankId'] = bankId;
    data['accountNumber'] = accountNumber;
    data['accountName'] = accountName;
    data['bankName'] = bankName;
    data['_id'] = sId;
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
      {fromState,
      fromTown,
      capacity,
      toState,
      toTown,
      travelTime,
      packageType,
      transportMode});

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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fromState'] = fromState;
    data['fromTown'] = fromTown;
    data['capacity'] = capacity;
    data['toState'] = toState;
    data['toTown'] = toTown;
    data['travelTime'] = travelTime;
    data['packageType'] = packageType;
    data['transportMode'] = transportMode;
    return data;
  }
}
