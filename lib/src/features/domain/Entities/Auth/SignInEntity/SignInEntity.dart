import 'dart:convert';

class SignInEntity {
  SignInEntity({
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
    this.refreshToken,
    this.expiresIn,
  });

  String? localId;
  String? email;
  String? displayName;
  String? idToken;
  bool? registered;
  String? refreshToken;
  String? expiresIn;

  factory SignInEntity.fromJson(String str) => SignInEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignInEntity.fromMap(Map<String, dynamic> json) => SignInEntity(
    localId: json["localId"] == null ? null : json["localId"],
    email: json["email"],
    displayName: json["displayName"] == null ? null : json["displayName"],
    idToken: json["idToken"] == null ? null : json["idToken"],
    registered: json["registered"] == null ? null : json["registered"],
    refreshToken: json["refreshToken"] == null ? null : json["refreshToken"],
    expiresIn: json["expiresIn"],
  );

  Map<String, dynamic> toMap() => {
    "localId": localId == null ? null : localId,
    "email": email == null ? null : email,
    "displayName": displayName == null ? null : displayName,
    "idToken": idToken == null ? null : idToken,
    "registered": registered == null ? null : registered,
    "refreshToken": refreshToken == null ? null : refreshToken,
    "expiresIn": expiresIn == null ? null : expiresIn,
  };
}