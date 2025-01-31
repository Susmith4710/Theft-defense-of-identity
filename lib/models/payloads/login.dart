import 'dart:convert';

import 'payloadable.dart';

class LoginPayload implements Payloadable {
  String username;
  String password;
  LoginPayload(this.username, this.password);
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
  @override
  String toJsonPayload() {
    return jsonEncode(this.toJson());
  }
}
