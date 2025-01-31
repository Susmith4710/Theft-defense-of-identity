// //Get Get monitired Items
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/utils/extensions.dart';

import 'financial_account.dart';
import 'insurance_provider.dart';
import 'loyalty_card.dart';
import 'monitored_item_type.dart';
import 'name.dart';
import 'phone.dart';


class MonitoredItem {
  String id;
  String createdAt;
  String updatedAt;
  MonitoredItemType itemType;
  String group;
  MonitoredItem(
      {required this.id,
      required this.createdAt,
      required this.group,
      required this.itemType,
      required this.updatedAt});
  MonitoredItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdAt = json['createdAt'],
        group = json['group'],
        updatedAt = json['updatedAt'],
        itemType = monitoredItemTypeValues.map[json["itemType"]]!;

  static List<MonitoredItem> monitoredItemsFromJson(String str) =>
      List<MonitoredItem>.from(json.decode(str).map((x) {
        MonitoredItemType itemType =
            monitoredItemTypeValues.map[x["itemType"]]!;
        switch (itemType) {
          case MonitoredItemType.EMAIL:
            return MonitoredEmailItem.fromJson(x);
          case MonitoredItemType.ADDRESS:
            return MonitoredItem.fromJson(x); 
          case MonitoredItemType.BIRTHDATE:
            return MonitoredBirthDateItem.fromJson(x);
          case MonitoredItemType.PHONE:
            return MonitoredPhoneItem.fromJson(x);
          case MonitoredItemType.CREDIT_CARD:
            return MonitoredItem.fromJson(x);
          case MonitoredItemType.INSURANCE_CARD:
            return MonitoredInsuranceProviderItem.fromJson(x);
          case MonitoredItemType.FINANCIAL_ACCOUNT:
            return MonitoredFinancialAccountItem.fromJson(x);
          case MonitoredItemType.DRIVER_LICENSE:
            return MoinitoredDrivingLicenseItem.fromJson(x);
          case MonitoredItemType.PASSPORT:
            return MonitoredPassportItem.fromJson(x);
          case MonitoredItemType.LOYALTY_CARD:
            return MonitoredLoyaltyCardItem.fromJson(x);
          case MonitoredItemType.NPI:
            return MonitoredItem.fromJson(x);
          case MonitoredItemType.NAME:
            return MonitoredNameItem.fromJson(x);
          case MonitoredItemType.SSN:
            return MoinitoredSSNItem.fromJson(x);

          default:
            return MonitoredItem.fromJson(x);
        }
      }));

  ///
  /// Max count for a given item type.
  static int getMaxCount(MonitoredItemType itemType) {
    switch (itemType) {
      case MonitoredItemType.EMAIL:
        return 10;
      case MonitoredItemType.ADDRESS:
        return 1;
      case MonitoredItemType.BIRTHDATE:
        return 1;
      case MonitoredItemType.PHONE:
        return 5;
      case MonitoredItemType.CREDIT_CARD:
        return 40;
      case MonitoredItemType.INSURANCE_CARD:
        return 3;
      case MonitoredItemType.FINANCIAL_ACCOUNT:
        return 5;
      case MonitoredItemType.DRIVER_LICENSE:
        return 1;
      case MonitoredItemType.PASSPORT:
        return 2;
      case MonitoredItemType.LOYALTY_CARD:
        return 10;
      case MonitoredItemType.NPI:
        return 1;
      default:
        return 1;
    }
  }

  String title() {
    switch (itemType) {
      case MonitoredItemType.EMAIL:
        return "Email";
      case MonitoredItemType.ADDRESS:
        return "Address";
      case MonitoredItemType.BIRTHDATE:
        return "Date of Birth";
      case MonitoredItemType.PHONE:
        return "Phone Number";
      case MonitoredItemType.CREDIT_CARD:
        return "Credit Card Number";
      case MonitoredItemType.INSURANCE_CARD:
        return "Health Insurance ID Number";
      case MonitoredItemType.FINANCIAL_ACCOUNT:
        return "Financial Account Number";
      case MonitoredItemType.DRIVER_LICENSE:
        return "Driver License";
      case MonitoredItemType.PASSPORT:
        return "Passport Number";
      case MonitoredItemType.LOYALTY_CARD:
        return "Loyalty Card Number";
      case MonitoredItemType.NPI:
        return "National Provider Identifier";
      default:
        return itemType.toString();
    }
  }

  IconData getIcon() {
    return AuraIcons.Dark_web;
  }

  bool isLocked() {
    return false;
  }

  String displayItem = "Display";

  int order = 19;
}

class MonitoredEmailItem extends MonitoredItem {
  String emailAddress;
  MonitoredEmailItem.fromJson(Map<String, dynamic> json)
      : emailAddress = json['emailAddress'],
        super.fromJson(json);
  @override
  int get order => 4;

  @override
  IconData getIcon() {
    return Idd_icons.mail;
  }
  @override
  String get displayItem => emailAddress;
}

class MonitoredNameItem extends MonitoredItem {
  Name name;
  MonitoredNameItem.fromJson(Map<String, dynamic> json)
      : name = Name.fromJson(json['name']),
        super.fromJson(json);
  @override
  IconData getIcon() {
    return AuraIcons.User;
  }

  @override
  int get order => 1;

  @override
  bool isLocked() {
    return true;
  }

  @override
  String title() {
    return "Name";
  }

  @override
  String get displayItem => this.name.first + ' ' + this.name.last;
}

class MoinitoredSSNItem extends MonitoredItem {
  String ssnLastFour;
  MoinitoredSSNItem.fromJson(Map<String, dynamic> json)
      : ssnLastFour = json['ssn']['lastFour'],
        super.fromJson(json);
  @override
  String title() {
    return "Social Security Number";
  }
  @override
  IconData getIcon() {
    
    return Idd_icons.ssn;
  }
  @override
  String get displayItem => "********"+ssnLastFour;
  @override
  // TODO: implement order
  int get order => 3;
}

class MoinitoredDrivingLicenseItem extends MonitoredItem {
  String dlLastFour;
  MoinitoredDrivingLicenseItem.fromJson(Map<String, dynamic> json)
      : dlLastFour = json['driverLicense']['lastFour'],
        super.fromJson(json);
  @override
  IconData getIcon() {
    return Idd_icons.id;//AuraIcons.id;
  }

  @override
  String title() {
    return "Driving License Number";
  }

  @override
  int get order => 9;
  @override
  // TODO: implement displayItem
  String get displayItem => "*********"+dlLastFour;
}

class MonitoredBirthDateItem extends MonitoredItem {
  String dateOfBirth;
  MonitoredBirthDateItem.fromJson(Map<String, dynamic> json)
      : dateOfBirth = json['birthDate'],
        super.fromJson(json);
  @override
  bool isLocked() {
    return true;
  }

  @override
  int get order => 2;

  @override
  IconData getIcon() {
    return Idd_icons.birthday;
  }
  

  @override
  String get displayItem => "**/**/****";
}

class MonitoredPhoneItem extends MonitoredItem {
  Phone phone;
  String phoneNumber;
  MonitoredPhoneItem.fromJson(Map<String, dynamic> json)
      : phone = Phone.fromJson(json["phone"]),
        phoneNumber = json['phoneNumber'],
        super.fromJson(json);
  @override
  IconData getIcon() {
    return Idd_icons.call;
  }
  @override
  String get displayItem => Utils.slicePhoneNumber(this.phoneNumber);
  @override
  // TODO: implement order
  int get order => 5;
}

class MonitoredFinancialAccountItem extends MonitoredItem {
  FinancialAccount account;
  MonitoredFinancialAccountItem.fromJson(Map<String, dynamic> json)
      : account = FinancialAccount.fromJson(json["financialAccount"]),
        super.fromJson(json);
        @override
  IconData getIcon() {
    return Idd_icons.bank;
  }
  @override
  String get displayItem => "********"+this.account.lastFour;
  @override
  // TODO: implement order
  int get order => 8;
}

class MonitoredInsuranceProviderItem extends MonitoredItem {
  InsuranceProviderAccount account;
  MonitoredInsuranceProviderItem.fromJson(Map<String, dynamic> json)
      : account = InsuranceProviderAccount.fromJson(json['healthInfo']),
        super.fromJson(json);
  @override
  IconData getIcon() {
    return Idd_icons.insurance;
  }
  @override
  String get displayItem => "********"+this.account.lastFour+"\r\n"+this.account.insuranceProvider;
  @override
  // TODO: implement order
  int get order => 7;
}

class MonitoredPassportItem extends MonitoredItem {
  String lastFour;
  MonitoredPassportItem.fromJson(Map<String, dynamic> json)
      : lastFour = json["passport"]["lastFour"],
        super.fromJson(json);
  @override
  IconData getIcon() {
    return Idd_icons.passport;
  }
  @override
  String get displayItem => "****"+this.lastFour;
  @override
  int get order => 10;
}

class MonitoredLoyaltyCardItem extends MonitoredItem {
  LoyaltyCard cardInfo;
  MonitoredLoyaltyCardItem.fromJson(Map<String, dynamic> json)
      : cardInfo = LoyaltyCard.fromJson(json['loyaltyCard']),
        super.fromJson(json);
        @override
  IconData getIcon() {
    return Idd_icons.loyalty_card;
  }
  @override
  String get displayItem => "*******"+this.cardInfo.lastFour;
  @override
  int get order => 11;
}
