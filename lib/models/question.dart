import 'dart:convert';

class Question {
  Question({
    required this.type,
    required this.id,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.group,
    required this.area,
    required this.meta,
    required this.singleSelection,
    required this.options,
    required this.includesNone,
    required this.includesOther,
    required this.otherId,
    required this.noneId,
  });

  static List<Question> getQuestionsFromJson(String str) => List<Question>.from(
    json.decode(str).map((x) => Question.fromJson(x["question"])));

  String type;
  String id;
  String label;
  String createdAt;
  String updatedAt;
  String? description;
  QuestionGroup group;
  String area;
  QuestionMeta meta;
  bool singleSelection;
  List<QuestionOption> options;
  bool includesNone;
  bool includesOther;
  int? otherId;
  int? noneId;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        type: json["type"],
        id: json["id"],
        label: json["label"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        description: json["description"],
        group: QuestionGroup.fromJson(json["group"]),
        area: json["area"],
        meta: QuestionMeta.fromJson(json["meta"]),
        singleSelection: json["singleSelection"],
        options:
            List<QuestionOption>.from(json["options"].map((x) => QuestionOption.fromJson(x))),
        includesNone: json["includesNone"],
        includesOther: json["includesOther"],
        otherId: json["otherId"],
        noneId: json["noneId"],
      );
}


class QuestionGroup {
  QuestionGroup({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory QuestionGroup.fromJson(Map<String, dynamic> json) => QuestionGroup(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );
}

class QuestionMeta {
  QuestionMeta({
    required this.display,
  });

  String? display;

  factory QuestionMeta.fromJson(Map<String, dynamic> json) => QuestionMeta(
        display: json["display"]
      );
}

class QuestionOption {
  QuestionOption({
    required this.id,
    required this.label,
  });

  int id;
  String label;

  factory QuestionOption.fromJson(Map<String, dynamic> json) => QuestionOption(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}

