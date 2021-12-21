class TransactionHistory {
  bool? status;
  String? message;
  String? token;
  List<Data>? data;

  TransactionHistory({this.status, this.message, this.token, this.data});

  TransactionHistory.fromJson(Map<String, dynamic> json) {
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

class Data {
  bool? status;
  String? sId;
  num? amount;
  String? type;
  String? currency;
  String? description;
  String? source;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data({
    this.status,
    this.sId,
    this.amount,
    this.type,
    this.currency,
    this.description,
    this.source,
    this.iV,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    amount = json['amount'];
    type = json['type'];
    currency = json['currency'];
    description = json['description'];
    source = json['source'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['_id'] = sId;
    data['amount'] = amount;
    data['type'] = type;
    data['currency'] = currency;
    data['description'] = description;
    data['source'] = source;
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }
}
