import 'dart:convert';

class MarketingOffer {
  MarketingOffer({
    required this.plan,
    required this.offer,
    required this.group,
    required this.isUserInTrial,
  });

  MarketingPlan plan;
  Offer offer;
  MarketingGroup group;
  bool isUserInTrial;

 static MarketingOffer offerFromJson(String str) =>
    MarketingOffer.fromJson(json.decode(str));


  factory MarketingOffer.fromJson(Map<String, dynamic> json) => MarketingOffer(
        plan: MarketingPlan.fromJson(json["plan"]),
        offer: Offer.fromJson(json["offer"]),
        group: MarketingGroup.fromJson(json["group"]),
        isUserInTrial: json["isUserInTrial"],
      );
}

class MarketingGroup {
  MarketingGroup({
    required this.code,
    required this.name,
    required this.type,
  });

  String code;
  String name;
  String type;

  factory MarketingGroup.fromJson(Map<String, dynamic> json) => MarketingGroup(
        code: json["code"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "type": type,
      };
}

class Offer {
  Offer({
    required this.billingType,
    required this.offerType,
    required this.code,
    required this.price,
    required this.retailPrice,
    required this.trialPrice,
    required this.trialDuration,
    required this.hasTrial,
    required this.hasPaidTrial,
    required this.hasFreeTrial,
    required this.customerBilled,
    required this.customerPrice,
    required this.subscriptionPlan,
    required this.description,
    required this.brandCode,
  });

  String billingType;
  String offerType;
  String code;
  int price;
  int retailPrice;
  int trialPrice;
  int trialDuration;
  bool hasTrial;
  bool hasPaidTrial;
  bool hasFreeTrial;
  bool customerBilled;
  int customerPrice;
  SubscriptionPlan subscriptionPlan;
  String description;
  String brandCode;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        billingType: json["billingType"],
        offerType: json["offerType"],
        code: json["code"],
        price: json["price"],
        retailPrice: json["retailPrice"],
        trialPrice: json["trialPrice"],
        trialDuration: json["trialDuration"],
        hasTrial: json["hasTrial"],
        hasPaidTrial: json["hasPaidTrial"],
        hasFreeTrial: json["hasFreeTrial"],
        customerBilled: json["customerBilled"],
        customerPrice: json["customerPrice"],
        subscriptionPlan: SubscriptionPlan.fromJson(json["subscriptionPlan"]),
        description: json["description"],
        brandCode: json["brandCode"],
      );
}

class SubscriptionPlan {
  SubscriptionPlan({
    required this.code,
    required this.termLength,
    required this.termName,
    required this.termDescription,
  });

  String code;
  int termLength;
  String termName;
  String termDescription;

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) =>
      SubscriptionPlan(
        code: json["code"],
        termLength: json["termLength"],
        termName: json["termName"],
        termDescription: json["termDescription"],
      );
}

class MarketingPlan {
  MarketingPlan({
    required this.code,
    required this.name,
    required this.tier,
    required this.family,
    required this.maxAdults,
    required this.maxChildren,
    required this.features,
  });

  String code;
  String name;
  String tier;
  bool family;
  int? maxAdults;
  int? maxChildren;
  List<String> features;

  factory MarketingPlan.fromJson(Map<String, dynamic> json) => MarketingPlan(
        code: json["code"],
        name: json["name"],
        tier: json["tier"],
        family: json["family"],
        maxAdults: json["maxAdults"],
        maxChildren: json["maxChildren"],
        features: List<String>.from(json["features"].map((x) => x)),
      );
}
