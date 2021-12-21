import 'package:trava/models/https/request/pick_a_package_response.dart';

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Data {
//   bool? isActive;
//   String? sId;
//   String? sendState;
//   String? sendTown;
//   Sender? sender;
//   String? type;
//   String? description;
//   int? quantity;
//   String? images;
//   String? deliveryMode;
//   String? pickupTime;
//   String? pickupLocation;
//   String? dropspot;
//   String? deliveryHub;
//   String? hub;
//   String? deliveryDate;
//   bool? isDelivered;
//   bool? isPickuped;
//   bool? isDropped;
//   bool? isReceived;
//   String? destState;
//   String? destTown;
//   bool? insurance;
//   bool? hasPaid;
//   num? amount;
//   String? paymentId;
//   int? iV;
//   String? createdAt;
//   String? updatedAt;
//   bool? isDroped;

//   Data(
//       {this.isActive,
//       this.sId,
//       this.sendState,
//       this.sendTown,
//       this.sender,
//       this.type,
//       this.description,
//       this.quantity,
//       this.images,
//       this.deliveryMode,
//       this.pickupTime,
//       this.pickupLocation,
//       this.dropspot,
//       this.deliveryHub,
//       this.hub,
//       this.deliveryDate,
//       this.isDelivered,
//       this.isPickuped,
//       this.isDropped,
//       this.isReceived,
//       this.destState,
//       this.destTown,
//       this.insurance,
//       this.hasPaid,
//       this.amount,
//       this.paymentId,
//       this.iV,
//       this.createdAt,
//       this.updatedAt,
//       this.isDroped});

//   Data.fromJson(Map<String, dynamic> json) {
//     isActive = json['isActive'];
//     sId = json['_id'];
//     sendState = json['sendState'];
//     sendTown = json['sendTown'];
//     sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
//     type = json['type'];
//     description = json['description'];
//     quantity = json['quantity'];
//     images = json['images'];
//     deliveryMode = json['deliveryMode'];
//     pickupTime = json['pickupTime'];
//     pickupLocation = json['pickupLocation'];
//     dropspot = json['dropspot'];
//     deliveryHub = json['deliveryHub'];
//     hub = json['hub'];
//     deliveryDate = json['deliveryDate'];
//     isDelivered = json['isDelivered'];
//     isPickuped = json['isPickuped'];
//     isDropped = json['isDropped'];
//     isReceived = json['isReceived'];
//     destState = json['destState'];
//     destTown = json['destTown'];
//     insurance = json['insurance'];
//     hasPaid = json['hasPaid'];
//     amount = json['amount'];
//     paymentId = json['paymentId'];
//     iV = json['__v'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     isDroped = json['isDroped'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['isActive'] = isActive;
//     data['_id'] = sId;
//     data['sendState'] = sendState;
//     data['sendTown'] = sendTown;
//     data['sender'] = sender != null ? sender!.toJson() : null;
//     data['type'] = type;
//     data['description'] = description;
//     data['quantity'] = quantity;
//     data['images'] = images;
//     data['deliveryMode'] = deliveryMode;
//     data['pickupTime'] = pickupTime;
//     data['pickupLocation'] = pickupLocation;
//     data['dropspot'] = dropspot;
//     data['deliveryHub'] = deliveryHub;
//     data['hub'] = hub;
//     data['deliveryDate'] = deliveryDate;
//     data['isDelivered'] = isDelivered;
//     data['isPickuped'] = isPickuped;
//     data['isDropped'] = isDropped;
//     data['isReceived'] = isReceived;
//     data['destState'] = destState;
//     data['destTown'] = destTown;
//     data['insurance'] = insurance;
//     data['hasPaid'] = hasPaid;
//     data['amount'] = amount;
//     data['paymentId'] = paymentId;
//     data['__v'] = iV;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['isDroped'] = isDroped;
//     return data;
//   }
// }
