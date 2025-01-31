
import 'package:idd_app/Utils/parser_utils.dart';

enum MonitoredItemType {
  NAME,
  BIRTHDATE,
  SSN,
  EMAIL,
  PHONE,
  CREDIT_CARD,
  INSURANCE_CARD,
  FINANCIAL_ACCOUNT,
  DRIVER_LICENSE,
  PASSPORT,
  LOYALTY_CARD,
  ADDRESS,
  NPI,
  UNKNOWN
}


final monitoredItemTypeValues = EnumValues<MonitoredItemType>({
  "ssn": MonitoredItemType.SSN,
  "name": MonitoredItemType.NAME,
  "birth date": MonitoredItemType.BIRTHDATE,
  "email": MonitoredItemType.EMAIL,
  "phone": MonitoredItemType.PHONE,
  "health info": MonitoredItemType.INSURANCE_CARD,
  "financial account": MonitoredItemType.FINANCIAL_ACCOUNT,
  "driver license": MonitoredItemType.DRIVER_LICENSE,
  "passport": MonitoredItemType.PASSPORT,
  "loyalty card number": MonitoredItemType.LOYALTY_CARD,
});