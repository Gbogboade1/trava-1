class ProfileData {
  bool? status;
  String? message;
  User? user;

  ProfileData({this.status, this.message, this.user});

  ProfileData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
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
  String? profileImg;
  String? password;
  List<Packages>? packages;
  List? deliveries;
  num? wallet;
  String? joinDate;
  List<Banks>? banks;
  List? cards;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Request? request;
  List<String>? hubs;

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
      this.wallet,
      this.joinDate,
      this.banks,
      this.cards,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.request,
      this.hubs});

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
        packages!.add(Packages.fromJson(v));
      });
    }
    if (json['deliveries'] != null) {
      deliveries = [];
      json['deliveries'].forEach((v) {
        deliveries!.add(v);
      });
    }
    wallet = json['wallet'];
    joinDate = json['joinDate'];
    if (json['banks'] != null) {
      banks = [];
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    request =
        json['request'] != null ? Request.fromJson(json['request']) : null;
    hubs = json['hubs'].cast<String>();
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
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
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
    if (request != null) {
      data['request'] = request!.toJson();
    }
    data['hubs'] = hubs;
    return data;
  }
}

class Packages {
  String? sId;
  String? sendState;
  String? sendTown;
  String? sender;
  bool? isActive;
  String? type;
  String? description;
  int? quantity;
  String? deliveryMode;
  String? pickupTime;
  String? pickupLocation;
  String? dropspot;
  String? deliveryHub;
  String? hub;
  String? deliveryDate;
  bool? isDelivered;
  bool? isPickuped;
  bool? isDropped;
  bool? isReceived;
  String? destState;
  String? destTown;
  bool? insurance;
  bool? hasPaid;
  num? amount;
  String? paymentId;
  String? deliveryCode;
  String? pickupCode;
  int? iV;
  String? createdAt;
  String? updatedAt;
  String? deliverer;
  String? images;
  bool? isPickeduped;
  bool? isDroped;

  Packages(
      {this.sId,
      this.sendState,
      this.sendTown,
      this.sender,
      this.isActive,
      this.type,
      this.description,
      this.quantity,
      this.deliveryMode,
      this.pickupTime,
      this.pickupLocation,
      this.dropspot,
      this.deliveryHub,
      this.hub,
      this.deliveryDate,
      this.isDelivered,
      this.isPickuped,
      this.isDropped,
      this.isReceived,
      this.destState,
      this.destTown,
      this.insurance,
      this.hasPaid,
      this.amount,
      this.paymentId,
      this.deliveryCode,
      this.pickupCode,
      this.iV,
      this.createdAt,
      this.updatedAt,
      this.deliverer,
      this.images,
      this.isPickeduped,
      this.isDroped});

  Packages.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sendState = json['sendState'];
    sendTown = json['sendTown'];
    sender = json['sender'];
    isActive = json['isActive'];
    type = json['type'];
    description = json['description'];
    quantity = json['quantity'];
    deliveryMode = json['deliveryMode'];
    pickupTime = json['pickupTime'];
    pickupLocation = json['pickupLocation'];
    dropspot = json['dropspot'];
    deliveryHub = json['deliveryHub'];
    hub = json['hub'];
    deliveryDate = json['deliveryDate'];
    isDelivered = json['isDelivered'];
    isPickuped = json['isPickuped'];
    isDropped = json['isDropped'];
    isReceived = json['isReceived'];
    destState = json['destState'];
    destTown = json['destTown'];
    insurance = json['insurance'];
    hasPaid = json['hasPaid'];
    amount = json['amount'];
    paymentId = json['paymentId'];
    deliveryCode = json['deliveryCode'];
    pickupCode = json['pickupCode'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deliverer = json['deliverer'];
    images = json['images'];
    isPickeduped = json['isPickeduped'];
    isDroped = json['isDroped'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sendState'] = sendState;
    data['sendTown'] = sendTown;
    data['sender'] = sender;
    data['isActive'] = isActive;
    data['type'] = type;
    data['description'] = description;
    data['quantity'] = quantity;
    data['deliveryMode'] = deliveryMode;
    data['pickupTime'] = pickupTime;
    data['pickupLocation'] = pickupLocation;
    data['dropspot'] = dropspot;
    data['deliveryHub'] = deliveryHub;
    data['hub'] = hub;
    data['deliveryDate'] = deliveryDate;
    data['isDelivered'] = isDelivered;
    data['isPickuped'] = isPickuped;
    data['isDropped'] = isDropped;
    data['isReceived'] = isReceived;
    data['destState'] = destState;
    data['destTown'] = destTown;
    data['insurance'] = insurance;
    data['hasPaid'] = hasPaid;
    data['amount'] = amount;
    data['paymentId'] = paymentId;
    data['deliveryCode'] = deliveryCode;
    data['pickupCode'] = pickupCode;
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deliverer'] = deliverer;
    data['images'] = images;
    data['isPickeduped'] = isPickeduped;
    data['isDroped'] = isDroped;
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

class Request {
  String? fromState;
  int? capacity;
  String? fromTown;
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
