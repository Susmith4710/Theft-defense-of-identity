import 'package:idd_app/models/alert_group.dart';
import 'package:idd_app/models/dependent_summary.dart';

class DashboardSummary {
  DashboardSummary({
    required this.alertSummary,
    required this.alertDependentsSummary,
    required this.percentComplete,
    required this.familySummary,
    required this.questionGroupSummary,
    required this.overallThreatLevel,
  });

  AlertSummary alertSummary;
  List<dynamic> alertDependentsSummary;
  int percentComplete;
  List<Dependent> familySummary;
  List<QuestionGroupSummary> questionGroupSummary;
  String overallThreatLevel;

  factory DashboardSummary.fromJson(Map<String, dynamic> json) => DashboardSummary(
        alertSummary: AlertSummary.fromJson(json["alertSummary"]),
        alertDependentsSummary:
            List<dynamic>.from(json["alertDependentsSummary"].map((x) => x)),
        percentComplete: json["percentComplete"],
        familySummary: List<Dependent>.from(json["familySummary"].map((x) => Dependent.fromJson(x))),
        questionGroupSummary: List<QuestionGroupSummary>.from(
            json["questionGroupSummary"]
                .map((x) => QuestionGroupSummary.fromJson(x))),
        overallThreatLevel: json["overallThreatLevel"],
      );
}

class AlertSummary {
  AlertSummary({
    required this.transaction,
    required this.socialMediaMonitoring,
    required this.highRisk,
    required this.activity,
    required this.darkweb,
    required this.cyberbullying,
    required this.ssnTrace,
    required this.threat,
    required this.publicRecord,
    required this.address,
  });

  AlertGroup transaction;
  AlertGroup socialMediaMonitoring;
  AlertGroup highRisk;
  AlertGroup activity;
  AlertGroup darkweb;
  AlertGroup cyberbullying;
  AlertGroup ssnTrace;
  AlertGroup threat;
  AlertGroup publicRecord;
  AlertGroup address;

  factory AlertSummary.fromJson(Map<String, dynamic> json) => AlertSummary(
        transaction: AlertGroup.fromJson("transaction",json["transaction"]),
        socialMediaMonitoring: AlertGroup.fromJson("socialMediaMonitoring",json["socialMediaMonitoring"]),
        highRisk: AlertGroup.fromJson("highRisk",json["highRisk"]),
        activity: AlertGroup.fromJson("activity",json["activity"]),
        darkweb: AlertGroup.fromJson("darkweb",json["darkweb"]),
        cyberbullying: AlertGroup.fromJson("cyberbullying",json["cyberbullying"]),
        ssnTrace: AlertGroup.fromJson("ssnTrace",json["ssnTrace"]),
        threat: AlertGroup.fromJson("threat",json["threat"]),
        publicRecord: AlertGroup.fromJson("publicRecord",json["publicRecord"]),
        address: AlertGroup.fromJson("address",json["address"]),
      );
}

// class Activity {
//   Activity({
//     required this.total,
//     required this.countUnresolved,
//     required this.countResolved,
//   });

//   int total;
//   int countUnresolved;
//   int countResolved;

//   factory Activity.fromJson(Map<String, dynamic> json) => Activity(
//         total: json["total"],
//         countUnresolved: json["countUnresolved"],
//         countResolved: json["countResolved"],
//       );

//   Map<String, dynamic> toJson() => {
//         "total": total,
//         "countUnresolved": countUnresolved,
//         "countResolved": countResolved,
//       };
// }

class QuestionGroupSummary {
  QuestionGroupSummary({
    required this.id,
    required this.name,
    required this.description,
    required this.index,
    required this.unansweredQuestionCount,
    required this.questionCount,
  });

  int id;
  String name;
  String description;
  int index;
  int unansweredQuestionCount;
  int questionCount;

  factory QuestionGroupSummary.fromJson(Map<String, dynamic> json) =>
      QuestionGroupSummary(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        index: json["index"],
        unansweredQuestionCount: json["unansweredQuestionCount"],
        questionCount: json["questionCount"],
      );
}
