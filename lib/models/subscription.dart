// To parse this JSON data, do
//
//     final subscriberDescriptor = subscriberDescriptorFromJson(jsonString);

import 'dart:convert';

import 'address.dart';
import 'credit_card.dart';
import 'name.dart';



class Subscription {
  Subscription({
    required this.accountId,
    required this.createdAt,
    required this.currentPeriodEndsAt,
    required this.address,
    required this.cancelledAt,
    required this.name,
    required this.id,
    required this.creditCard,
    required this.status,
  });

  String accountId;
  String createdAt;
  dynamic currentPeriodEndsAt;
  Address address;
  dynamic cancelledAt;
  Name name;
  String id;
  CreditCard creditCard;
  String status;

  static Subscription subscriptionFromJson(String str) =>
    Subscription.fromJson(json.decode(str));

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      Subscription(
        accountId: json["accountId"],
        createdAt: json["createdAt"],
        currentPeriodEndsAt: json["currentPeriodEndsAt"],
        address: Address.fromJson(json["address"]),
        cancelledAt: json["cancelledAt"],
        name: Name.fromJson(json["name"]),
        id: json["id"],
        creditCard: CreditCard.fromJson(json["creditCard"]),
        status: json["status"],
      );
}
