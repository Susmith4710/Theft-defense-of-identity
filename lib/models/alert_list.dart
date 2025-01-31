// To parse this JSON data, do
//
//     final alertList = alertListFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/models/activity_alert.dart';
import 'package:idd_app/models/address_monitoring_alert.dart';
import 'package:idd_app/models/cyberbullying_alert.dart';
import 'package:idd_app/models/dark_web_alert.dart';
import 'package:idd_app/models/high_risk_alert.dart';
import 'package:idd_app/models/publicrecord_alert.dart';
import 'package:idd_app/models/social_media_monitoring_alert.dart';
import 'package:idd_app/models/ssntrace_alert.dart';
import 'package:idd_app/models/threat_alert.dart';
import 'package:idd_app/models/transaction_alert.dart';
import 'package:idd_app/utils/parser_utils.dart';
import 'package:intl/intl.dart';


enum AlertType {
  ACTIVITY,
  THREAT,
  DARKWEB,
  CYBERBULLYING,
  TRANSACTION,
  PUBLICRECORD,
  SSNTRACE,
  ADDRESS,
  SOCIALMONITORING,
  HIGHRISK
}

final alertTypeValues = EnumValues<AlertType>({
  'threat': AlertType.THREAT,
  'activity': AlertType.ACTIVITY,
  'darkweb': AlertType.DARKWEB,
  'cyberbullying': AlertType.CYBERBULLYING,
  'transaction': AlertType.TRANSACTION,
  'public record': AlertType.PUBLICRECORD,
  'ssn trace': AlertType.SSNTRACE,
  'address': AlertType.ADDRESS,
  'social media monitoring': AlertType.SOCIALMONITORING,
  'high risk': AlertType.HIGHRISK
});

class AlertList {
  // Pageable Response for type T
  AlertList({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.alerts,
  });

  int page;
  int pageSize;
  int total;
  List<Alert> alerts;

  static AlertList alertListFromJson(String str) =>
      AlertList.fromJson(json.decode(str));

  factory AlertList.fromJson(Map<String, dynamic> json) => AlertList(
        page: json["page"],
        pageSize: json["pageSize"],
        total: json["total"],
        alerts: List<Alert>.from(json["content"].map((x) {
          AlertType alertType = alertTypeValues.map[x["alertType"]]!;
          switch (alertType) {
            case AlertType.ACTIVITY:
              return ActivityAlert.fromJson(x);
            case AlertType.ADDRESS:
              return AddressMonitoringAlert.fromJson(x);
            case AlertType.CYBERBULLYING:
              return CyberbullyingAlert.fromJson(x);
            case AlertType.DARKWEB:
              return DarkWebAlert.fromJson(x);
            case AlertType.THREAT:
              return ThreatAlert.fromJson(x);
            case AlertType.TRANSACTION:
              return TransactionAlert.fromJson(x);
            case AlertType.PUBLICRECORD:
              return PublicrecordAlert.fromJson(x);
            case AlertType.SSNTRACE:
              return SsnTraceAlert.fromJson(x);
            case AlertType.SOCIALMONITORING:
              return SocialMediaMonitoringAlert.fromJson(x);
            case AlertType.HIGHRISK:
              return HighRiskAlert.fromJson(x);

            default:
              return Alert.fromJson(x);
          }
        })),
      );
}

 class Alert {
  Alert({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.resolved,
    required this.shared,
    required this.viewed,
    required this.group,
    required this.status,
    required this.actions,
    required this.title,
    required this.category,
    required this.key,
    required this.alertType,
    required this.riskLevel,
    required this.riskAreas,
    required this.scoreImpacts,
  });

  // String type;
  String createdAt; //x
  String updatedAt; //x
  String id; //x
  bool resolved; //x
  bool shared; //x
  bool viewed; //x
  String group; //x
  String status; //x
  List<AlertAction> actions;
  // AlertDetails details;
  String title; //x
  // String disposition;
  // String activityType;
  // String rawActivityType;
  // String activityCategory;
  // String reportedAt;
  // String toolId;
  // String activityId;
  String category; //x
  String key; //x
  String alertType; //x
  String riskLevel; //x
  List<String> riskAreas; //x
  ScoreImpacts scoreImpacts; //x
  // String whatWasFound;
  // String whatDoesThisMean;
  // String whatDoIDoNow;
  // String reportedBy;

  Alert.fromJson(Map<String, dynamic> json)
      : createdAt = json["createdAt"],
        updatedAt = json["updatedAt"],
        id = json["id"],
        resolved = json["resolved"],
        shared = json["shared"],
        viewed = json["viewed"],
        group = json["group"],
        status = json["status"],
        actions = List<AlertAction>.from(
            json["actions"].map((x) => AlertAction.fromJson(x))),
        title = json["title"],
        category = json["category"],
        key = json["key"],
        alertType = json["alertType"],
        riskLevel = json["riskLevel"],
        riskAreas = List<String>.from(json["riskAreas"].map((x) => x)),
        scoreImpacts = ScoreImpacts.fromJson(json["scoreImpacts"]);

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "resolved": resolved,
        "shared": shared,
        "viewed": viewed,
        "group": group,
        "status": status,
        "actions": List<dynamic>.from(actions.map((x) => x)),
        "title": title,
        "category": category,
        "key": key,
        "alertType": alertType,
        "riskLevel": riskLevel,
        "riskAreas": List<String>.from(riskAreas.map((x) => x)),
        "scoreImpacts": scoreImpacts.toJson(),
      };

  String formattedCreatedDate() {
    DateTime dateTime = DateTime.parse(this.updatedAt);
    // Format to Mar, 7 2020
    return DateFormat("MMM, dd yyyy").format(dateTime);
  }

  IconData getIcon() {
    return Idd_icons.alerts_mobile ;//AuraIcons.Address;
  }
}

class AlertAction {
  String id;
  String body;
  bool completed;
  String? reason;
  String? completedBy;
  List<String> tools;
  String title;
  String createdAt;
  String? completedAt;
  String? groupCode;
  String updatedAt;
  AlertAction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        body = json['body'],
        completed = json['completed'],
        reason = json['reason'],
        completedBy = json['completedBy'],
        title = json['title'],
        createdAt = json['createdAt'],
        completedAt = json['completedAt'],
        groupCode = json['groupCode'],
        tools = List<String>.from(json['tools'].map((x) => x)),
        updatedAt = json['updatedAt'];
}

class ScoreImpacts {
  ScoreImpacts();

  factory ScoreImpacts.fromJson(Map<String, dynamic> json) => ScoreImpacts();

  Map<String, dynamic> toJson() => {};
}
