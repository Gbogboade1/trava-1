class DeliveryCostResponse {
  DeliveryCostResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });
  late final bool status;
  late final String message;
  late final num data;
  late final String token;
  
  DeliveryCostResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data;
    _data['token'] = token;
    return _data;
  }
}