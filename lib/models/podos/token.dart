
class TravaTokenModel {
  String? accessToken;
  String? email;
  DateTime? createdAt;

  TravaTokenModel({
    required this.accessToken,
    required this.createdAt,
    required this.email
  });

  TravaTokenModel.fromJson(
    Map<String, dynamic> json,
  )   : accessToken = json["accessToken"],
        email =json["email"] ,
        createdAt = json["createdAt"] ?? DateTime.now();

  toJson() {
    return {
      "accessToken": accessToken,
      "email": email,
      "createdAt": createdAt?.toIso8601String() ?? '',
    };
  }
}
