class TopUpWallet {
  int? amount;
  String? cardId;

  TopUpWallet({this.amount, this.cardId});

  TopUpWallet.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    cardId = json['cardId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['amount'] = this.amount;
    data['cardId'] = this.cardId;
    return data;
  }
}
