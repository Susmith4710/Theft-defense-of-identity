import 'package:idd_app/models/alert_list.dart';

class SsnTraceAlert extends Alert{
  String childMonitoringType;
  SsnTraceDetails details;
  SsnTraceAlert.fromJson(Map<String, dynamic> json) :
    childMonitoringType = json["type"],
    details = SsnTraceDetails.fromJson(json["details"]),
   super.fromJson(json);

}

class SsnTraceDetails {
  String firstName;
  String lastName;
  String lastSeenDate;
  String lastFourSSN;
  List<String> dataFound;
  List<String> sources;
  List<String>ssnInfos;
  List<String> names;
  List<String> addresses;

  SsnTraceDetails.fromJson(Map<String,dynamic> json):
  firstName = json["firstName"],
  lastFourSSN = json["lastFourSSN"],
  lastSeenDate = json["lastSeenDate"],
  lastName = json["lastName"],
  dataFound = List<String>.from(json["dataFound"]),
  sources  = List<String>.from(json["sources"]),
  ssnInfos = List<String>.from(json["ssnInfos"]),
  addresses = List<String>.from(json["addresses"]),
  names = List<String>.from(json["names"]);
}