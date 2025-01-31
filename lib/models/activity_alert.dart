import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/models/alert_list.dart';


class ActivityAlert extends Alert{

  String activityType;
  String rawActivityType;
  String activityCategory;
  String? organizationType;
  String? reportedBy;
  String reportedAt;
  String toolId;
  String? accountType;
  String activityId;
  String disposition;
  String whatWasFound;
  String whatDoesThisMean;
  String whatDoIDoNow;
  String? caseNumber;
  String? errorMessage;
  String? alertFlow;
  String? activityDetails;
  //details missing.

      ActivityAlert.fromJson(Map<String,dynamic> json):
            activityType=json["activityType"],
            rawActivityType=json["rawActivityType"],
            activityCategory=json["activityCategory"],
            organizationType=json["organizationType"],
            reportedBy=json["reportedBy"],
            reportedAt=json["reportedAt"],
            toolId=json["toolId"],
            accountType=json["accountType"],
            activityId=json["activityId"],
            disposition=json["disposition"],
            whatWasFound=json["whatWasFound"],
            whatDoesThisMean=json["whatDoesThisMean"],
            whatDoIDoNow=json["whatDoIDoNow"],
            caseNumber=json["caseNumber"],
            errorMessage=json["errorMessage"],
            alertFlow=json["alertFlow"],
            activityDetails=json["activityDetails"],
            super.fromJson(json);

            IconData getIcon() => Idd_icons.credit_monitoring;
}