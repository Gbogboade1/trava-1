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
  bool? status;
  String? sId;
  double? amount;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['amount'] = this.amount;
    data['type'] = this.type;
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['source'] = this.source;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;

    return data;
  }
}
