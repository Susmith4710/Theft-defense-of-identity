import 'package:idd_app/models/alert_list.dart';

// social media monitoring
class SocialMediaMonitoringAlert extends Alert {
  SocialMediaMonitoringDetails details;
  SocialMediaMonitoringAlert.fromJson(Map<String, dynamic> json)
      : details = SocialMediaMonitoringDetails.fromJson(json['details']),
        super.fromJson(json);
}

class SocialMediaMonitoringDetails {
  String network;
  String ruleName;
  String alertType;
  String perpetratorUrl;
  String perpetratorContent;
  String offendingContentUrl;
  String perpetratorUsername;
  String perpetratorTimestamp;
  String perpetratorDisplayName;
  String perpetratorParentPostUrl;
  int ruleId;

  SocialMediaMonitoringDetails.fromJson(Map<String, dynamic> json)
      : network = json["network"],
        ruleName = json["ruleName"],
        alertType = json["alertType"],
        perpetratorUrl = json["perpetratorUrl"],
        perpetratorContent = json["perpetratorContent"],
        offendingContentUrl = json["offendingContentUrl"],
        perpetratorUsername = json["perpetratorUsername"],
        perpetratorTimestamp = json["perpetratorTimestamp"],
        perpetratorDisplayName = json["perpetratorDisplayName"],
        perpetratorParentPostUrl = json["perpetratorParentPostUrl"],
        ruleId = json["ruleId"];
}
