class SendPackageResponse {
  bool? status;
  String? message;
  Data? data;
  String? token;

  SendPackageResponse({this.status, this.message, this.data, this.token});

  SendPackageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
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
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
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
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
