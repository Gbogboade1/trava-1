class TopUpWalletResponse {
  bool? status;
  String? message;
  Data? data;
  String? token;

  TopUpWalletResponse({this.status, this.message, this.data, this.token});

  TopUpWalletResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Data {
  String? method;
  double? paymentFee;
  num? amount;
  Config? config;

  Data({this.method, this.paymentFee, this.amount, this.config});

  Data.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    paymentFee = json['paymentFee'];
    amount = json['amount'];
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    data['paymentFee'] = this.paymentFee;
    data['amount'] = this.amount;
    if (this.config != null) {
      data['config'] = this.config!.toJson();
    }
    return data;
  }
}

class Config {
  num? txRef;
  String? currency;
  String? paymentOptions;
  Customer? customer;
  Meta? meta;
  num? amount;
  String? publicKey;
  Customizations? customizations;

  Config(
      {this.txRef,
      this.currency,
      this.paymentOptions,
      this.customer,
      this.meta,
      this.amount,
      this.publicKey,
      this.customizations});

  Config.fromJson(Map<String, dynamic> json) {
    txRef = json['tx_ref'];
    currency = json['currency'];
    paymentOptions = json['payment_options'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    amount = json['amount'];
    publicKey = json['public_key'];
    customizations = json['customizations'] != null
        ? new Customizations.fromJson(json['customizations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tx_ref'] = this.txRef;
    data['currency'] = this.currency;
    data['payment_options'] = this.paymentOptions;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['amount'] = this.amount;
    data['public_key'] = this.publicKey;
    if (this.customizations != null) {
      data['customizations'] = this.customizations!.toJson();
    }
    return data;
  }
}

class Customer {
  String? email;
  String? phonenumber;
  String? name;

  Customer({this.email, this.phonenumber, this.name});

  Customer.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phonenumber = json['phonenumber'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['name'] = this.name;
    return data;
  }
}

class Meta {
  String? userId;
  String? fullname;
  String? email;
  String? transactionId;
  String? allow;

  Meta({this.userId, this.fullname, this.email, this.transactionId});

  Meta.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullname = json['fullname'];
    email = json['email'];
    transactionId = json['transactionId'];
    allow = json['allow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['fullname'] = fullname;
    data['email'] = email;
    data['transactionId'] = this.transactionId;
    data['allow'] = this.allow;
    return data;
  }
}

class Customizations {
  String? title;
  String? logo;

  Customizations({this.title, this.logo});

  Customizations.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['logo'] = this.logo;
    return data;
  }
}
