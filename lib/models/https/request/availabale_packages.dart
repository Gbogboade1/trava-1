import 'package:trava/models/https/request/pick_a_package_response.dart';

class AvailablePackages {
  bool? status;
  String? message;
  List<Data>? data;
  String? token;

  AvailablePackages({this.status, this.message, this.data, this.token});

  AvailablePackages.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    return data;
  }
}
