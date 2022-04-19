class Hubs {
  bool? status;
  String? message;
  List<Data>? data;

  Hubs({status, message, data});

  Hubs.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? description;
  String? state;
  String? town;
  List<String>? images;
  String? owner;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {sId,
      name,
      description,
      state,
      town,
      images,
      owner,
      isVerified,
      createdAt,
      updatedAt,
      iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    state = json['state'];
    town = json['town'];
    images = json['images'].cast<String>();
    owner = json['owner'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['state'] = state;
    data['town'] = town;
    data['images'] = images;
    data['owner'] = owner;
    data['isVerified'] = isVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
