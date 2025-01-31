import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/models/alert_list.dart';

class DarkWebAlert extends Alert {
  String toolId;
  bool? cvv;
  String? accountType;
  String? insuranceProvider;
  bool? passwordFound;
  String breachName;
  String? lastFour;
  String? lastOne;
  String? cardName;
  String reportedAt;
  String? emailAddress;
  String whatWasFound;
  String whatDoesThisMean;
  String whatShouldIDoNow;

  DarkWebAlert.fromJson(Map<String, dynamic> json)
      : toolId = json["toolId"],
        cvv = json["cvv"],
        accountType = json["accountType"],
        insuranceProvider = json["insuranceProvider"],
        passwordFound = json["passwordFound"],
        breachName = json["breachName"],
        lastFour = json["lastFour"],
        lastOne = json["lastOne"],
        cardName = json["cardName"],
        reportedAt = json["reportedAt"],
        emailAddress = json["emailAddress"],
        whatWasFound = json["whatWasFound"],
        whatDoesThisMean = json["whatDoesThisMean"],
        whatShouldIDoNow = json["whatShouldIDoNow"],
        super.fromJson(json);
  IconData getIcon() {
    return AuraIcons.Dark_web;
  }
}
