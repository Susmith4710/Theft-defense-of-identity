// Helper class for Monitored Item
import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/models/monitored_item_type.dart';

class MonitoredItemHelper {

  static String getTitle(MonitoredItemType itemType){
    switch(itemType){
    case MonitoredItemType.ADDRESS: return "Home Address";
    case MonitoredItemType.EMAIL: return "Email Address";
    case MonitoredItemType.CREDIT_CARD: return "Credit Card Number";
    case MonitoredItemType.INSURANCE_CARD: return "Health Insurance ID Number";
    case MonitoredItemType.FINANCIAL_ACCOUNT: return "Financial Account Number";
    case MonitoredItemType.DRIVER_LICENSE: return "Driver's License Number";
    case MonitoredItemType.PASSPORT: return "Passport Number";
    case MonitoredItemType.LOYALTY_CARD: return "Loyalty Card Number";
    case MonitoredItemType.PHONE : return "Phone Number";
    case MonitoredItemType.NPI: return "National Provider Identifier";
    default: return "Dark Web";
    }
  }

  static Icon getIcon(MonitoredItemType itemType){
    switch(itemType){
    case MonitoredItemType.ADDRESS: return Icon(Idd_icons.home);
    case MonitoredItemType.EMAIL: return Icon(Idd_icons.mail);
    case MonitoredItemType.CREDIT_CARD: return Icon(Idd_icons.credit_card);
    case MonitoredItemType.INSURANCE_CARD: return Icon(Idd_icons.insurance);
    case MonitoredItemType.FINANCIAL_ACCOUNT: return Icon(Idd_icons.bank);
    case MonitoredItemType.DRIVER_LICENSE: return Icon(Idd_icons.id);
    case MonitoredItemType.PASSPORT: return Icon(Idd_icons.passport);
    case MonitoredItemType.LOYALTY_CARD: return Icon(Idd_icons.loyalty_card);
    case MonitoredItemType.PHONE : return Icon(Idd_icons.call);
    case MonitoredItemType.NPI: return Icon(Idd_icons.npi);
    case MonitoredItemType.SSN: return Icon(Idd_icons.ssn);
      default:return Icon(Idd_icons.dark_web);
    }
  }
  static int getMaxCount(MonitoredItemType itemType) {
    switch(itemType){
      case MonitoredItemType.ADDRESS: return 10;
    case MonitoredItemType.EMAIL: return 10;
    case MonitoredItemType.CREDIT_CARD: return 400;
    case MonitoredItemType.INSURANCE_CARD: return 3;
    case MonitoredItemType.FINANCIAL_ACCOUNT: return 4;
    case MonitoredItemType.DRIVER_LICENSE: return 2;
    case MonitoredItemType.PASSPORT: return 2;
    case MonitoredItemType.LOYALTY_CARD: return 5;
    case MonitoredItemType.PHONE : return 1;
    case MonitoredItemType.NPI: return 3;
      default:return 10;
    }
  }

}