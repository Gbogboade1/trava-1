import 'package:trava/models/https/request/pick_a_package_response.dart';

class Notifications {
  bool? status;
  String? message;
  List<User>? user;
  String? token;

  Notifications({this.status, this.message, this.user, this.token});

  Notifications.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['user'] != null) {
      user = [];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? sId;
  bool? hasRead;
  String? category;
  String? description;
  Data? owner;
  int? iV;
  String? createdAt;
  String? updatedAt;

  User(
      {this.sId,
      this.hasRead,
      this.category,
      this.description,
      this.owner,
      this.iV,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hasRead = json['hasRead'];
    category = json['category'];
    description = json['description'];
    owner = json['owner'] != null ? Data.fromJson(json['owner']) : null;
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['hasRead'] = hasRead;
    data['description'] = description;
    data['category'] = category;
    if (this.owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
