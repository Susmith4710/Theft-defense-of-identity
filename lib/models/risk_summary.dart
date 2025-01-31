import 'dart:convert';

// GET -> /client/scoring/risk/v2
class RiskScoreSummary {
  RiskScoreSummary({
    required this.months,
    required this.weeks,
    required this.days,
  });

  List<RiskScore> months;
  List<RiskScore> weeks;
  List<RiskScore> days;


  static RiskScoreSummary riskSummaryFromJson(String str) => RiskScoreSummary.fromJson(json.decode(str));
  factory RiskScoreSummary.fromJson(Map<String, dynamic> json) => RiskScoreSummary(
        months: List<RiskScore>.from(json["months"].map((x) => RiskScore.fromJson(x))),
        weeks: List<RiskScore>.from(json["weeks"].map((x) => RiskScore.fromJson(x))),
        days: List<RiskScore>.from(json["days"].map((x) => RiskScore.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "months": List<dynamic>.from(months.map((x) => x.toJson())),
        "weeks": List<dynamic>.from(weeks.map((x) => x.toJson())),
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
      };
}

class RiskScore {
  RiskScore({
    required this.createdAt,
    required this.userId,
    required this.dayAs,
    required this.descriptor,
    required this.ms,
    required this.rms,
  });

  String createdAt;
  String userId;
  int dayAs;
  String descriptor;
  int ms;
  int rms;

  factory RiskScore.fromJson(Map<String, dynamic> json) => RiskScore(
        createdAt: json["createdAt"],
        userId: json["userId"],
        dayAs: json["as"],
        descriptor: json["descriptor"],
        ms: json["ms"],
        rms: json["rms"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "userId": userId,
        "as": dayAs,
        "descriptor": descriptor,
        "ms": ms,
        "rms": rms,
      };
}



