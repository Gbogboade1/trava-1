import 'package:trava/models/https/request/pick_a_package_response.dart';

class HistoryTBDResponse {
  bool? status;
  String? message;
  String? token;
  List<Data>? data;

  HistoryTBDResponse({this.status, this.message, this.token, this.data});

  HistoryTBDResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
  String? sId;
  String? sendState;
  String? sendTown;
  Sender? sender;
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
  Sender? deliverer;
  bool? isActive;
  String? dropspot;

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
      this.iV,
      this.deliverer,
      this.isActive,
      this.dropspot});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sendState = json['sendState'];
    sendTown = json['sendTown'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
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
    deliverer = json['deliverer'] != null
        ? new Sender.fromJson(json['deliverer'])
        : null;
    isActive = json['isActive'];
    dropspot = json['dropspot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sendState'] = this.sendState;
    data['sendTown'] = this.sendTown;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
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
    if (this.deliverer != null) {
      data['deliverer'] = this.deliverer!.toJson();
    }
    data['isActive'] = this.isActive;
    data['dropspot'] = this.dropspot;
    return data;
  }
}
