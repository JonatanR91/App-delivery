import 'dart:convert';

class AuthErrorDecodable {
  AuthErrorDecodableError? error;

  AuthErrorDecodable({
    this.error,
  });

  factory AuthErrorDecodable.fromJson(String str) => AuthErrorDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthErrorDecodable.fromMap(Map<String, dynamic> json) => AuthErrorDecodable(
    error: AuthErrorDecodableError.fromMap(json["error"]),
  );

  Map<String, dynamic> toMap() => {
    "error": error?.toMap(),
  };
}

class AuthErrorDecodableError {
  int? code;
  String? message;
  List<ErrorElement>? errors;

  AuthErrorDecodableError({
    this.code,
    this.message,
    this.errors,
  });

  factory AuthErrorDecodableError.fromJson(String str) => AuthErrorDecodableError.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthErrorDecodableError.fromMap(Map<String, dynamic> json) => AuthErrorDecodableError(
    code: json["code"],
    message: json["message"],
    errors: List<ErrorElement>.from(json["errors"].map((x) => ErrorElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "message": message,
    "errors": List<dynamic>.from(errors!.map((x) => x.toMap())),
  };
}

class ErrorElement {
  String? message;
  String? domain;
  String? reason;

  ErrorElement({
    this.message,
    this.domain,
    this.reason,
  });

  factory ErrorElement.fromJson(String str) => ErrorElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorElement.fromMap(Map<String, dynamic> json) => ErrorElement(
    message: json["message"],
    domain: json["domain"],
    reason: json["reason"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "domain": domain,
    "reason": reason,
  };
}
