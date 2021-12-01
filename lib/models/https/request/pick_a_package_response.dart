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
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
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
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
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
        ? new Sender.fromJson(json['deliverer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sendState'] = this.sendState;
    data['sendTown'] = this.sendTown;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['isActive'] = this.isActive;
    data['type'] = this.type;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['images'] = this.images;
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
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.deliverer != null) {
      data['deliverer'] = this.deliverer!.toJson();
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
    data['packages'] = this.packages;
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
