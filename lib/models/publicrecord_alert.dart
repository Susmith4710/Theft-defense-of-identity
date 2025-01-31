import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/models/alert_list.dart';

import 'address.dart';

class PublicrecordAlert extends Alert {
  String prType;
  PublicRecordDetails details;
  PublicrecordAlert.fromJson(Map<String, dynamic> json)
      : prType = json["type"],
        details = PublicRecordDetails.fromJson(json["details"]),
        super.fromJson(json);
  IconData getIcon() {
    return AuraIcons.User;
  }
}

class PublicRecordDetails {
  String parcelNumber;
  Address address;
  String lenderName;
  String? offense;
  String? dateReported;
  String? offenseDate;
  String? offenseState;
  String? offenseDescription;
  String? arrestDate;
  String? arrestLevel;
  String? arrestingAgency;
  String? recordDate;
  String saleDate;
  String parcelId;
  String? newRecordDate;
  String? dateDetected;
  String? name;
  String? dateOfInitialRegistration;
  String? dateOfRegistration;
  String? convictionDate;
  String? courtName;
  String? race;
  String? hairColor;
  String? eyeColor;
  String? height;
  String? weight;
  String? skinTone;
  String? buildType;
  String? shoeSize;
  String? sex;
  String? registeredAddress;
  String? streetNumber;
  String? streetName;
  String? city;
  String? state;

  List<String> ownerNames;
  List<String> sellerNames;

  PublicRecordDetails.fromJson(Map<String, dynamic> json)
      : lenderName = json["lenderName"],
        offense = json["offense"],
        dateReported = json["dateReported"],
        offenseDate = json["offenseDate"],
        offenseState = json["offenseState"],
        offenseDescription = json["offenseDescription"],
        arrestDate = json["arrestDate"],
        arrestLevel = json["arrestLevel"],
        arrestingAgency = json["arrestingAgency"],
        recordDate = json["recordDate"],
        saleDate = json["saleDate"],
        parcelId = json["parcelId"],
        newRecordDate = json["newRecordDate"],
        dateDetected = json["dateDetected"],
        name = json["name"],
        dateOfInitialRegistration = json["dateOfInitialRegistration"],
        dateOfRegistration = json["dateOfRegistration"],
        convictionDate = json["convictionDate"],
        courtName = json["courtName"],
        race = json["race"],
        hairColor = json["hairColor"],
        eyeColor = json["eyeColor"],
        height = json["height"],
        weight = json["weight"],
        skinTone = json["skinTone"],
        buildType = json["buildType"],
        shoeSize = json["shoeSize"],
        sex = json["sex"],
        registeredAddress = json["registeredAddress"],
        streetNumber = json["streetNumber"],
        streetName = json["streetName"],
        city = json["city"],
        state = json["state"],
        sellerNames = List<String>.from(json["sellerNames"]),
        ownerNames = List<String>.from(json["ownerNames"]),
        parcelNumber = json["parcelNumber"],
        address = Address.fromJson(json["address"]);
}
