import 'package:trava/models/https/request/pick_a_package_response.dart';

class SendPackageResponse {
  bool? status;
  String? message;
  Data? data;
  String? token;

  SendPackageResponse({this.status, this.message, this.data, this.token});

  SendPackageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

// class Data {
//   String? sId;
//   String? sendState;
//   String? sendTown;
//   String? sender;
//   String? type;
//   String? description;
//   int? quantity;
//   String? images;
//   String? deliveryMode;
//   String? pickupTime;
//   String? pickupLocation;
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
//   double? amount;
//   String? paymentId;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

//   Data(
//       {this.sId,
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
//       this.createdAt,
//       this.updatedAt,
//       this.iV});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     sendState = json['sendState'];
//     sendTown = json['sendTown'];
//     sender = json['sender'];
//     type = json['type'];
//     description = json['description'];
//     quantity = json['quantity'];
//     images = json['images'];
//     deliveryMode = json['deliveryMode'];
//     pickupTime = json['pickupTime'];
//     pickupLocation = json['pickupLocation'];
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
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['sendState'] = sendState;
//     data['sendTown'] = sendTown;
//     data['sender'] = sender;
//     data['type'] = type;
//     data['description'] = description;
//     data['quantity'] = quantity;
//     data['images'] = images;
//     data['deliveryMode'] = deliveryMode;
//     data['pickupTime'] = pickupTime;
//     data['pickupLocation'] = pickupLocation;
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
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = iV;
//     return data;
//   }
// }
