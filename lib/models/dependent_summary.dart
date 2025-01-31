import 'dart:convert';

import 'name.dart';
//GET -> /api/client/invitors

class DependentSummary {
  DependentSummary({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.status,
    required this.userId,
    this.maxChildren,
    this.maxAdults,
    required this.participants,
    required this.isAdultLimitReached,
    required this.isChildLimitReached,
  });

  String createdAt;
  String updatedAt;
  String id;
  String status;
  String userId;
  dynamic maxChildren;
  dynamic maxAdults;
  List<Dependent> participants;
  bool isAdultLimitReached;
  bool isChildLimitReached;

  static DependentSummary summaryFromJson(String str) =>
      DependentSummary.fromJson(json.decode(str));

  factory DependentSummary.fromJson(Map<String, dynamic> json) =>
      DependentSummary(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        status: json["status"],
        userId: json["userId"],
        maxChildren: json["maxChildren"],
        maxAdults: json["maxAdults"],
        participants: List<Dependent>.from(
            json["participants"].map((x) => Dependent.fromJson(x))),
        isAdultLimitReached: json["isAdultLimitReached"],
        isChildLimitReached: json["isChildLimitReached"],
      );
}

class Dependent {
  String createdAt;
  String updatedAt;
  String id;
  String status;
  String participantType;
  Name name;
  String relationship;
  String? emailAddress;
  bool visible;

  Dependent.fromJson(Map<String, dynamic> json)
      : createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        id = json['id'],
        status = json['status'],
        name = Name.fromJson(json['name']),
        participantType = json['participantType'],
        relationship = json['relationship'],
        emailAddress = json['emailAddress'],
        visible = json['visible'];

  bool isChild() {
    return this.participantType == 'child';
  }

  String relationForDisplay() {
    return this.relationship[0].toUpperCase() + this.relationship.substring(1);
  }

  static List<String> get adultOptions => [
    "Spouse",
    "Son",
    "Daughter",
    "Father",
    "Mother",
    "Brother",
    "Sister",
    "Grand Father",
    "Grand Mother",
    "Uncle",
    "Aunt",
    "Cousin",
    "In-law",
    "Significant Other",
    "Roommate",
    "Family"
  ];

  static List<String> get childOptions => [
    "Son",
    "Daughter",
    "Grandson",
    "Granddaughter",
    "Nephew",
    "Niece",
    "Dependent",
    "Step-child",
    "Family"
  ];
}
