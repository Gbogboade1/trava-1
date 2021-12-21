import 'package:trava/models/https/request/pick_a_package_response.dart';

class RequestDelieverResponse {
  bool? status;
  String? message;
  List<Data>? data;
  String? token;

  RequestDelieverResponse({this.status, this.message, this.data, this.token});

  RequestDelieverResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    return data;
  }
}
