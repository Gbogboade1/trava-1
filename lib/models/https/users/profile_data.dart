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
        json['request'] != null ? new Request.fromJson(json['request']) : null;
    hubs = json['hubs'].cast<String>();
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
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    if (this.deliveries != null) {
      data['deliveries'] = this.deliveries!.map((v) => v.toJson()).toList();
    }
    data['wallet'] = this.wallet;
    data['joinDate'] = this.joinDate;
    if (this.banks != null) {
      data['banks'] = this.banks!.map((v) => v.toJson()).toList();
    }
    if (this.cards != null) {
      data['cards'] = this.cards!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.request != null) {
      data['request'] = this.request!.toJson();
    }
    data['hubs'] = this.hubs;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sendState'] = this.sendState;
    data['sendTown'] = this.sendTown;
    data['sender'] = this.sender;
    data['isActive'] = this.isActive;
    data['type'] = this.type;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['deliveryMode'] = this.deliveryMode;
    data['pickupTime'] = this.pickupTime;
    data['pickupLocation'] = this.pickupLocation;
    data['dropspot'] = this.dropspot;
    data['deliveryHub'] = this.deliveryHub;
    data['hub'] = this.hub;
    data['deliveryDate'] = this.deliveryDate;
    data['isDelivered'] = this.isDelivered;
    data['isPickuped'] = this.isPickuped;
    data['isDropped'] = this.isDropped;
    data['isReceived'] = this.isReceived;
    data['destState'] = this.destState;
    data['destTown'] = this.destTown;
    data['insurance'] = this.insurance;
    data['hasPaid'] = this.hasPaid;
    data['amount'] = this.amount;
    data['paymentId'] = this.paymentId;
    data['deliveryCode'] = this.deliveryCode;
    data['pickupCode'] = this.pickupCode;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deliverer'] = this.deliverer;
    data['images'] = this.images;
    data['isPickeduped'] = this.isPickeduped;
    data['isDroped'] = this.isDroped;
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
