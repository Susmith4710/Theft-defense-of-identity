// -> GET -> /client/users/{userId}
import 'package:idd_app/models/address.dart';

import 'name.dart';

class UserProfile {
  String createdAt;
  String updatedAt;
  String id;
  String type;
  String status;
  Name name;
  String aasMigrated;
  String billingProvider;
  String? serviceEndDate;
  String username;
  String emailAddress;
  String phoneNumber;
  String birthDate;
  UserAccount account;
  UserProfileVerification verification;
  String enrollmentType;
  Address address;
  String brandCode;
  String? employeeId;
  String locale;
  String ssnLastFour;

  UserProfile.fromJson(Map<String, dynamic> json)
      : createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        id = json['id'],
        type = json['type'],
        status = json['status'],
        name = Name.fromJson(json['name']),
        aasMigrated = json['aasMigrated'],
        billingProvider = json['billingProvider'],
        serviceEndDate = json['serviceEndDate'],
        username = json['username'],
        emailAddress = json['emailAddress'],
        account = UserAccount.fromJson(json['account']),
        birthDate = json['birthDate'],
        verification = UserProfileVerification.fromJson(json['verification']),
        enrollmentType = json['enrollmentType'],
        address = Address.fromJson(json['address']),
        brandCode = json['brandCode'],
        employeeId = json['employeeId'],
        locale = json['locale'],
        phoneNumber = json['phoneNumber'],
        ssnLastFour = json['ssnLastFour'];
}

class UserAccount {
  String pin;
  int loginFailures;
  String lastLoginFailure;
  UserAccount(
      {required this.pin,
      required this.lastLoginFailure,
      required this.loginFailures});
  UserAccount.fromJson(Map<String, dynamic> json)
      : pin = json['pin'],
        loginFailures = json['loginFailures'],
        lastLoginFailure = json['lastLoginFailure'];
}

class UserProfileVerification {
  bool pidVerified;
  bool verified;
  String? eidNextRetry;
  UserProfileVerification.fromJson(Map<String, dynamic> json)
      : pidVerified = json['pidVerified'],
        verified = json['verified'],
        eidNextRetry = json['eidNextRetry'];
}
