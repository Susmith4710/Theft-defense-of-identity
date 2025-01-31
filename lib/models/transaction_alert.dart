import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/models/alert_list.dart';

class TransactionAlert extends Alert {
  String ftmType;
  String disposition;
  String institutionId;
  String institutionName;
  String itemId;
  String userId;
  String merchant;
  String accountId;
  String transactionId;
  int transactionAmount;
  String transactionDate;
  String accountType;
  String lastFourOfAccount;
  String merchantCategory;
  String transactionType;
  int thresholdAmount;
  bool? pending;
  String? previousTransactionId;
  String? previousTransactionDate;
  String category;
  String? transactionStatus;
  String? whatShouldIDoNow;

  TransactionAlert.fromJson(Map<String, dynamic> json)
      : ftmType = json["type"],
        disposition = json["disposition"],
        institutionId = json["institutionId"],
        institutionName = json["institutionName"],
        itemId = json["itemId"],
        userId = json["userId"],
        merchant = json["merchant"],
        accountId = json["accountId"],
        transactionId = json["transactionId"],
        transactionAmount = json["transactionAmount"],
        transactionDate = json["transactionDate"],
        accountType = json["accountType"],
        lastFourOfAccount = json["lastFourOfAccount"],
        merchantCategory = json["merchantCategory"],
        transactionType = json["transactionType"],
        thresholdAmount = json["thresholdAmount"],
        pending = json["pending"],
        previousTransactionId = json["previousTransactionId"],
        previousTransactionDate = json["previousTransactionDate"],
        category = json["category"],
        transactionStatus = json["transactionStatus"],
        whatShouldIDoNow = json["whatShouldIDoNow"],
        super.fromJson(json);

  IconData getIcon() {
    return AuraIcons.Transaction;
  }
}
