import 'package:flutter/cupertino.dart';

String? validateEmail(String emailValue) {
  if (emailValue.length == 0) {
    return "Please enter a valid email";
  } else {
    return null;
  }
}

String? validatePassword(String value, BuildContext context) {
  if (value.isEmpty) {
    return "Please enter the password"; //SetNewPasswordStrings.emptyPasswordErrorText;
  } else if (value.length < 4) {
    return "Please enter the correct password";
  }
  return null;
}

class Utils {
  static String slicePhoneNumber(String originalNumber) {
    // first remove all the non-digit characters if already present.
    String strippedOne = originalNumber.replaceAll(RegExp(r'\D'), "");
    if (strippedOne.length > 7) {
      String reformatted = strippedOne.replaceAllMapped(
          RegExp(r'(\d{3})(\d{3})(\d+)'),
          (match) =>
              "${match[1]}-${match[2]}-${match[3]}"); //replaceFirst("(\d{1})(\d{3})(\d{3})(\d+)", "\$1-\$2-\$3-\$4");
      return reformatted;
    }
    return strippedOne;
  }

  static String? isValidEmail(String? emailAddress) {
    if (emailAddress == null) {
      return 'Email empty';
    }
    if (emailAddress.isEmpty) {
      return 'Email cannot be empty';
    }
    // Make regex for email
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailAddress)) {
      return null;
    } else {
      return 'Enter a valid email address';
    }
  }

  static String? isValidChild(DateTime? dateOfBirth) {
    if (dateOfBirth == null) {
      return 'Please choose date of birth';
    }
    // should not be older than 18 years
    return null;
    // if(dateOfBirth.)
  }

  static String? isValidSSN(String? ssn) {
    if (ssn == null) {
      return 'Please enter SSN';
    }
    if (ssn.length != 9) {
      return 'Invalid SSN number';
    }
  }
}
