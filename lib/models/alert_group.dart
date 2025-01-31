// To parse this JSON data, do
//
//     final alertList = alertListFromJson(jsonString);

import 'dart:convert';
// API GET -> /api/client/alert/group 
class AlertGroup {
  AlertGroup({
    required this.total,
    required this.countUnresolved,
    required this.countResolved,
    required this.groupName
  });

  int total;
  int countUnresolved;
  int countResolved;
  String groupName;

  factory AlertGroup.fromJson(String groupName ,Map<String, dynamic> json) => AlertGroup(
        total: json["total"],
        countUnresolved: json["countUnresolved"],
        countResolved: json["countResolved"],
        groupName: groupName
      );

  // Static method for Alert Groups
  List<AlertGroup> alertGroupFromJson(String str) =>  Map.from(json.decode(str)).entries.map((e) => AlertGroup.fromJson(e.key, e.value)).toList();
        
}
