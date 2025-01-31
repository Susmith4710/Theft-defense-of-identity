// To parse this JSON data, do
//

import 'dart:convert';

import 'package:intl/intl.dart';


class CreditScore {
  CreditScore({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.score,
    required this.status,
    required this.factors,
    required this.descriptor,
  });
  // Ratings range
  // 300..499 Very Poor
  // 500..500 Poor
  // 601..660 Fair
  // 661..780 Good
  // 781..850 Excellent

  static String getRatingString(int score){
    if(score > 300 && score < 499){
      return 'Very Poor';
    }
    if(score > 500 && score < 599){
      return 'Poor';
    }
    if(score > 600 && score < 660){
      return 'Fair';
    }
    if(score > 661 && score < 780){
      return 'Good';
    }
    if(score > 781 && score < 850){
      return 'Excellent';
    }
    if(score < 300){return 'Unknwon';}
    if(score> 850) {return 'Invalid';}
    return 'Unknown';
  }

  DateTime createdAt; // Need to get this into Date format
  String updatedAt;
  String id;
  int score;
  String status;
  List<CreditScoreFactor> factors;
  String descriptor;

static List<CreditScore> creditScoresFromJson(String str) =>
    List<CreditScore>.from(
        json.decode(str).map((x) => CreditScore.fromJson(x)));

  factory CreditScore.fromJson(Map<String, dynamic> json) => CreditScore(
      createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
        id: json["id"],
        score: json["score"],
        status: json["status"],
        factors:
            List<CreditScoreFactor>.from(json["factors"].map((x) => CreditScoreFactor.fromJson(x))),
        descriptor: json["descriptor"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "score": score,
        "status": status,
        "factors": List<dynamic>.from(factors.map((x) => x.toJson())),
        "descriptor": descriptor,
      };
      DateFormat dateFormat = DateFormat("MM/dd/yyyy");
      String get displayableCreatedDate =>  dateFormat.format(createdAt);
}

class CreditScoreFactor {
  CreditScoreFactor({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.bureau,
    required this.factorType,
    required this.texts,
  });

  String createdAt;
  String updatedAt;
  String id;
  String bureau;
  String factorType;
  CreditScoreTexts texts;

  factory CreditScoreFactor.fromJson(Map<String, dynamic> json) => CreditScoreFactor(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        bureau: json["bureau"],
        factorType: json["factorType"],
        texts: CreditScoreTexts.fromJson(json["texts"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "bureau": bureau,
        "factorType": factorType,
        "texts": texts.toJson(),
      };
}

class CreditScoreTexts {
  CreditScoreTexts({
    required this.explain,
    required this.cando,
    required this.factor,
  });

  String explain;
  String cando;
  String factor;

  factory CreditScoreTexts.fromJson(Map<String, dynamic> json) => CreditScoreTexts(
        explain: json["explain"],
        cando: json["cando"],
        factor: json["factor"],
      );

  Map<String, dynamic> toJson() => {
        "explain": explain,
        "cando": cando,
        "factor": factor,
      };
}
enum CreditScoreStatus {
  none,
  unknown,
  notEligible,
  available
}
