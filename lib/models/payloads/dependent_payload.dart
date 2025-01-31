import 'dart:convert';

import 'package:idd_app/models/payloads/payloadable.dart';
import 'package:intl/intl.dart';

class DependentPayload implements Payloadable {
  String? relationShip;
  DateTime? dateOfBirth;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? ssn;

  @override
  Map<String, dynamic> toJson() {
    DateFormat format = DateFormat('yyyy-MM-dd'); //MM
    String dobString = "";
    if (dateOfBirth != null) {
      dobString = format.format(dateOfBirth!);
    }

    return {
      "name": {"first": firstName ?? "", "last": lastName ?? ""},
      "relationship": relationShip?.toUpperCase() ?? "",
      "emailAddress": emailAddress ?? "",
      "birthDate": dobString,
      "ssn": ssn ?? ""
    };
  }

  Map<String, dynamic> adultJson() {
    return {
      "name": {"first": firstName ?? "", "last": lastName ?? ""},
      "relationship": relationShip?.toUpperCase() ?? "",
      "emailAddress": emailAddress ?? ""
    };
  }

  Map<String, dynamic> childJson() {
    DateFormat format = DateFormat('yyyy-MM-dd'); //MM
    String dobString = "";
    if (dateOfBirth != null) {
      dobString = format.format(dateOfBirth!);
    }

    return {
      "name": {"first": firstName ?? "", "last": lastName ?? ""},
      "relationship": relationShip?.toUpperCase() ?? "",
      "birthDate": dobString,
      "ssn": ssn ?? "",
      "authorization": "CHILD_AUTH"
    };
  }

  String toString() {
    return this.toJson().toString();
  }

  @override
  String toJsonPayload() {
    return jsonEncode(this.toJson());
  }
}
