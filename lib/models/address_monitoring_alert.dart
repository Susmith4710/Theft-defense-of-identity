import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';

import 'alert_list.dart';

// address
class AddressMonitoringAlert extends Alert {
  AddressMonitoringDetails details;
  AddressMonitoringAlert.fromJson(Map<String, dynamic> json)
      : details = AddressMonitoringDetails.fromJson(json['details']),
        super.fromJson(json);
  IconData getIcon() {
    return Idd_icons.home;
  }
}

class AddressMonitoringDetails {
  String moveEffectiveDate;
  String? moveTypeCode;
  String newAddress;
  String standardizedAddress;
  AddressMonitoringDetails.fromJson(Map<String, dynamic> json)
      : moveEffectiveDate = json['moveEffectiveDate'],
        moveTypeCode = json['moveTypeCode'],
        newAddress = json['newAddress'],
        standardizedAddress = json['standardizedAddress'];
}
