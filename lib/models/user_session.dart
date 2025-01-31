import 'package:intl/intl.dart';

import 'name.dart';

// > POST >  sessions/login
class UserSession {
  String accessToken;
  String refreshToken;
  SessionProfile profile;
  UserSession(
      {required this.accessToken,
      required this.refreshToken,
      required this.profile});
  UserSession.fromJson(Map<String, dynamic> json)
      : accessToken = json['accessToken'],
        refreshToken = json['refreshToken'],
        profile = SessionProfile.fromJson(json['profile']);
}

class SessionToken {
  String accessToken;
  String refreshToken;
  SessionToken({required this.accessToken, required this.refreshToken});
  SessionToken.fromJson(Map<String, dynamic> json)
      : accessToken = json['accessToken'],
        refreshToken = json['refreshToken'];
}

class SessionProfile {
  String identifier;
  String emailAddress;
  Name name;
  String employerGroupName;
  String status;
  DateTime lastVisitedAt;
  String? subscriptionId;
  String locale;
  String? migratedAt;
  SessionProfile(
      {required this.identifier,
      required this.emailAddress,
      required this.name,
      required this.employerGroupName,
      required this.status,
      required this.lastVisitedAt,
      required this.subscriptionId,
      required this.locale,
      required this.migratedAt});
  SessionProfile.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        emailAddress = json['emailAddress'],
        name = Name.fromJson(json['name']),
        employerGroupName = json['employerGroupName'],
        status = json['status'],
        lastVisitedAt = DateTime.parse(json["lastVisitedAt"]),
        subscriptionId = json['subscriptionId'],
        locale = json['locale'],
        migratedAt = json['migratedAt'];

  DateFormat _dateFormat = DateFormat('MMM, dd yyyy');
  String get displayableFormat => _dateFormat.format(this.lastVisitedAt);
}
