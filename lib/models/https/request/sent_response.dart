class HistorySentResponse {
  bool? status;
  String? message;
  String? token;
  List<Data>? data;

  HistorySentResponse({this.status, this.message, this.token, this.data});

  HistorySentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool? isActive;
  String? sId;
  String? sendState;
  String? sendTown;
  String? sender;
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
  bool? isDroped;

  Data(
      {this.isActive,
      this.sId,
      this.sendState,
      this.sendTown,
      this.sender,
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
      this.isDroped});

  Data.fromJson(Map<String, dynamic> json) {
    isActive = json['isActive'];
    sId = json['_id'];
    sendState = json['sendState'];
    sendTown = json['sendTown'];
    sender = json['sender'];
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
    isDroped = json['isDroped'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['sendState'] = this.sendState;
    data['sendTown'] = this.sendTown;
    data['sender'] = this.sender;
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
    data['isDroped'] = this.isDroped;
    return data;
  }
}
