class PickAPackageResponse {
  bool? status;
  String? message;
  String? token;
  Data? data;

  PickAPackageResponse({this.status, this.message, this.token, this.data});

  PickAPackageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? sendState;
  String? sendTown;
  Sender? sender;
  bool? isActive;
  String? type;
  String? description;
  int? quantity;
  String? images;
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
  double? amount;
  String? paymentId;
  int? iV;
  String? createdAt;
  String? updatedAt;
  Sender? deliverer;

  Data(
      {this.sId,
      this.sendState,
      this.sendTown,
      this.sender,
      this.isActive,
      this.type,
      this.description,
      this.quantity,
      this.images,
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
      this.iV,
      this.createdAt,
      this.updatedAt,
      this.deliverer});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sendState = json['sendState'];
    sendTown = json['sendTown'];
    sender =
        json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    isActive = json['isActive'];
    type = json['type'];
    description = json['description'];
    quantity = json['quantity'];
    images = json['images'];
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
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deliverer = json['deliverer'] != null
        ? Sender.fromJson(json['deliverer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sendState'] = sendState;
    data['sendTown'] = sendTown;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    data['isActive'] = isActive;
    data['type'] = type;
    data['description'] = description;
    data['quantity'] = quantity;
    data['images'] = images;
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
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (deliverer != null) {
      data['deliverer'] = deliverer!.toJson();
    }
    return data;
  }
}

class Sender {
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
  double? wallet;
  String? joinDate;
  List? banks;
  List? cards;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Request? request;
  List<String>? hubs;

  Sender(
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

  Sender.fromJson(Map<String, dynamic> json) {
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
    if (request != null) {
      data['request'] = request!.toJson();
    }
    data['hubs'] = hubs;
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
