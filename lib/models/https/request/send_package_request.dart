class SendPackageRequest {
  String? deliveryHub;
  String? pickupLocation;
  String? pickupTime;
  String? deliveryDate;
  String? destTown;
  String? destState;
  String? deliveryMode;
  String? quantity;
  String? description;
  String? type;
  String? sendTown;
  String? sendState;
  String? images;

  SendPackageRequest(
      {this.deliveryHub,
      this.pickupLocation,
      this.pickupTime,
      this.deliveryDate,
      this.destTown,
      this.destState,
      this.deliveryMode,
      this.quantity,
      this.description,
      this.type,
      this.sendTown,
      this.sendState,
      this.images});

  SendPackageRequest.fromJson(Map<String, dynamic> json) {
    deliveryHub = json['deliveryHub'];
    pickupLocation = json['pickupLocation'];
    pickupTime = json['pickupTime'];
    deliveryDate = json['deliveryDate'];
    destTown = json['destTown'];
    destState = json['destState'];
    deliveryMode = json['deliveryMode'];
    quantity = json['quantity'];
    description = json['description'];
    type = json['type'];
    sendTown = json['sendTown'];
    sendState = json['sendState'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deliveryHub'] = deliveryHub;
    data['pickupLocation'] = pickupLocation;
    data['pickupTime'] = pickupTime;
    data['deliveryDate'] = deliveryDate;
    data['destTown'] = destTown;
    data['destState'] = destState;
    data['deliveryMode'] = deliveryMode;
    data['quantity'] = quantity;
    data['description'] = description;
    data['type'] = type;
    data['sendTown'] = sendTown;
    data['sendState'] = sendState;
    data['images'] = images;
    return data;
  }
}
