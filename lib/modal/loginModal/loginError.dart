// import 'dart:convert';

// LoginError loginErrorFromJson(String str) => LoginError.fromJson(json.decode(str));

// String loginErrorToJson(LoginError data) => json.encode(data.toJson());

class LoginError {
  LoginError({
    this.error,
  });

  String error;

  factory LoginError.fromJson(Map<String, dynamic> json) => LoginError(
        error: json["error"] == null ? null : json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
      };
}
