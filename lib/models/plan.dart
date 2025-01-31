// To parse this JSON data, do
//
//     final fetchPlans = fetchPlansFromJson(jsonString);

import 'dart:convert';
// GET -> api/client/plans

class Plan {
  Plan({
    required this.name,
    required this.code,
    required this.description,
    required this.planFeatures,
    required this.family,
    required this.tier,
    required this.features,
  });

static  Plan planFromJson(String str) =>
    Plan.fromJson(json.decode(str));


  String name;
  String code;
  String description;
  List<PlanFeature> planFeatures;
  bool family;
  String tier;
  List<Feature> features;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        name: json["name"],
        code: json["code"],
        description: json["description"],
        planFeatures: List<PlanFeature>.from(
            json["planFeatures"].map((x) => PlanFeature.fromJson(x))),
        family: json["family"],
        tier: json["tier"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "description": description,
        "planFeatures": List<dynamic>.from(planFeatures.map((x) => x.toJson())),
        "family": family,
        "tier": tier,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
      };
}

class Feature {
  Feature({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.category,
    required this.group,
    required this.requirementType,
    required this.childFeature,
    required this.primaryAdultFeature,
    required this.secondaryAdultFeature,
    required this.attributes,
  });

  String createdAt;
  String updatedAt;
  String id;
  String code;
  String name;
  String description;
  String category;
  String group;
  String requirementType;
  bool childFeature;
  bool primaryAdultFeature;
  bool secondaryAdultFeature;
  List<Attribute> attributes;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        code: json["code"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        group: json["group"],
        requirementType: json["requirementType"],
        childFeature: json["childFeature"],
        primaryAdultFeature: json["primaryAdultFeature"],
        secondaryAdultFeature: json["secondaryAdultFeature"],
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "code": code,
        "name": name,
        "description": description,
        "category":  category,
        "group": group,
        "requirementType": requirementType,
        "childFeature": childFeature,
        "primaryAdultFeature": primaryAdultFeature,
        "secondaryAdultFeature": secondaryAdultFeature,
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
      };
}

class Attribute {
  Attribute({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.description,
  });

  DateTime createdAt;
  DateTime updatedAt;
  dynamic id;
  String name;
  String description;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "name": name,
        "description": description,
      };
}
 
 

class PlanFeature {
  PlanFeature({
    required this.feature,
    required this.config,
  });

  Feature feature;
  dynamic config;

  factory PlanFeature.fromJson(Map<String, dynamic> json) => PlanFeature(
        feature: Feature.fromJson(json["feature"]),
        config: json["config"],
      );

  Map<String, dynamic> toJson() => {
        "feature": feature.toJson(),
        "config": config,
      };
}

