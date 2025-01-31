import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/models/alert_list.dart';

// high risk
class HighRiskAlert extends Alert {
  String group;
  String toolId;
  String disposition;
  String activityType;
  String rawActivityType;
  String activityCategory;
  String reportedBy;
  String accountType;
  String activityId;
  String reportedAt;
  String category;
  String key;

  HighRiskAlert.fromJson(Map<String, dynamic> json)
      : group = json["group"],
        toolId = json["toolId"],
        disposition = json["disposition"],
        activityType = json["activityType"],
        rawActivityType = json["rawActivityType"],
        activityCategory = json["activityCategory"],
        reportedBy = json["reportedBy"],
        accountType = json["accountType"],
        activityId = json["activityId"],
        reportedAt = json["reportedAt"],
        category = json["category"],
        key = json["key"],
        super.fromJson(json);

       IconData getIcon() => Idd_icons.attention;
}
