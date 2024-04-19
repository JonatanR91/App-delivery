
import 'dart:convert';

class UpdatePasswordDecodable {
  UpdatePasswordDecodable({
    this.kind,
    this.email,
  });

  String? kind;
  String? email;

  factory UpdatePasswordDecodable.fromJson(String str) => UpdatePasswordDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePasswordDecodable.fromMap(Map<String, dynamic> json) => UpdatePasswordDecodable(
    kind: json["kind"] == null ? null : json["kind"],
    email: json["email"] == null ? null : json["email"],
  );

  Map<String, dynamic> toMap() => {
    "kind": kind == null ? null : kind,
    "email": email == null ? null : email,
  };
}