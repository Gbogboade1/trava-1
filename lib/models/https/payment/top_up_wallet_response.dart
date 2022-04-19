class TopUpWalletResponse {
  bool? status;
  String? message;
  Data? data;
  String? token;

  TopUpWalletResponse({status, message, data, token});

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

  Data({method, paymentFee, amount, config});

  Data.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    paymentFee = json['paymentFee'];
    amount = json['amount'];
    config =
        json['config'] != null ? Config.fromJson(json['config']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['method'] = method;
    data['paymentFee'] = paymentFee;
    data['amount'] = amount;
    if (config != null) {
      data['config'] = config!.toJson();
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
      {txRef,
      currency,
      paymentOptions,
      customer,
      meta,
      amount,
      publicKey,
      customizations});

  Config.fromJson(Map<String, dynamic> json) {
    txRef = json['tx_ref'];
    currency = json['currency'];
    paymentOptions = json['payment_options'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    amount = json['amount'];
    publicKey = json['public_key'];
    customizations = json['customizations'] != null
        ? Customizations.fromJson(json['customizations'])
        : null;
  }

  Map<String, dynamic> toJson() {
     Map<String, dynamic> data = Map<String, dynamic>();
    data['tx_ref'] = txRef;
    data['currency'] = currency;
    data['payment_options'] = paymentOptions;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['amount'] = amount;
    data['public_key'] = publicKey;
    if (customizations != null) {
      data['customizations'] = customizations!.toJson();
    }
    return data;
  }
}

class Customer {
  String? email;
  String? phonenumber;
  String? name;

  Customer({email, phonenumber, name});

  Customer.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phonenumber = json['phonenumber'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['name'] = name;
    return data;
  }
}

class Meta {
  String? userId;
  String? fullname;
  String? email;
  String? transactionId;
  String? allow;

  Meta({userId, fullname, email, transactionId});

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
    data['transactionId'] = transactionId;
    data['allow'] = allow;
    return data;
  }
}

class Customizations {
  String? title;
  String? logo;

  Customizations({title, logo});

  Customizations.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['logo'] = logo;
    return data;
  }
}
