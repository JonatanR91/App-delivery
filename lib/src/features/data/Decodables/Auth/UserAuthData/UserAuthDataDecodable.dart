
import 'dart:convert';

class UserAuthDataDecodable {
  UserAuthDataDecodable({
    this.kind,
    this.users,
  });

  String? kind;
  List<User>? users;

  factory UserAuthDataDecodable.fromJson(String str) => UserAuthDataDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAuthDataDecodable.fromMap(Map<String, dynamic> json) => UserAuthDataDecodable(
    kind: json["kind"] == null ? null : json["kind"],
    users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "kind": kind == null ? null : kind,
    "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toMap())),
  };
}

class User {
  User({
    this.localId,
    this.email,
    this.passwordHash,
    this.emailVerified,
    this.passwordUpdatedAt,
    this.providerUserInfo,
    this.validSince,
    this.lastLoginAt,
    this.createdAt,
    this.lastRefreshAt,
  });

  String? localId;
  String? email;
  String? passwordHash;
  bool? emailVerified;
  int? passwordUpdatedAt;
  List<ProviderUserInfo>? providerUserInfo;
  String? validSince;
  String? lastLoginAt;
  String? createdAt;
  DateTime? lastRefreshAt;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    localId: json["localId"] == null ? null : json["localId"],
    email: json["email"] == null ? null : json["email"],
    passwordHash: json["passwordHash"] == null ? null : json["passwordHash"],
    emailVerified: json["emailVerified"] == null ? null : json["emailVerified"],
    passwordUpdatedAt: json["passwordUpdatedAt"] == null ? null : json["passwordUpdatedAt"],
    providerUserInfo: json["providerUserInfo"] == null ? null : List<ProviderUserInfo>.from(json["providerUserInfo"].map((x) => ProviderUserInfo.fromMap(x))),
    validSince: json["validSince"] == null ? null : json["validSince"],
    lastLoginAt: json["lastLoginAt"] == null ? null : json["lastLoginAt"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    lastRefreshAt: json["lastRefreshAt"] == null ? null : DateTime.parse(json["lastRefreshAt"]),
  );

  Map<String, dynamic> toMap() => {
    "localId": localId == null ? null : localId,
    "email": email == null ? null : email,
    "passwordHash": passwordHash == null ? null : passwordHash,
    "emailVerified": emailVerified == null ? null : emailVerified,
    "passwordUpdatedAt": passwordUpdatedAt == null ? null : passwordUpdatedAt,
    "providerUserInfo": providerUserInfo == null ? null : List<dynamic>.from(providerUserInfo!.map((x) => x.toMap())),
    "validSince": validSince == null ? null : validSince,
    "lastLoginAt": lastLoginAt == null ? null : lastLoginAt,
    "createdAt": createdAt == null ? null : createdAt,
    "lastRefreshAt": lastRefreshAt == null ? null : lastRefreshAt!.toIso8601String(),
  };
}

class ProviderUserInfo {
  ProviderUserInfo({
    this.providerId,
    this.federatedId,
    this.email,
    this.rawId,
  });

  String? providerId;
  String? federatedId;
  String? email;
  String? rawId;

  factory ProviderUserInfo.fromJson(String str) => ProviderUserInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProviderUserInfo.fromMap(Map<String, dynamic> json) => ProviderUserInfo(
    providerId: json["providerId"] == null ? null : json["providerId"],
    federatedId: json["federatedId"] == null ? null : json["federatedId"],
    email: json["email"] == null ? null : json["email"],
    rawId: json["rawId"] == null ? null : json["rawId"],
  );

  Map<String, dynamic> toMap() => {
    "providerId": providerId == null ? null : providerId,
    "federatedId": federatedId == null ? null : federatedId,
    "email": email == null ? null : email,
    "rawId": rawId == null ? null : rawId,
  };
}