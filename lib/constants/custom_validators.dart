import 'package:flutter/cupertino.dart';

import '../localization/languages/languages.dart';

class CustomValidator {
  static String? email(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return Languages.of(context)!.emailIsRequired;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return Languages.of(context)!.pleaseEnterValidEmail;
    }
    return null;
  }
  static String? description(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return Languages.of(context)!.descriptionIsRequired;
    }
    // else if (value.length < 10) {
    //   return ' description should not be greater less than 2 words';
    // }
    return null;
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return ' Password is required';
    } else if (value.length < 6) {
      return ' Password should be greater then 6 digits';
    }
    return null;
  }

  static String? loginPassword(String? value) {
    if (value!.isEmpty) {
      return ' Password is required';
    }

    return null;
  }

  static String? confirmPassword(String? value, String oldPassword) {
    if (value!.isEmpty) {
      return ' Confirm Password is required';
    } else if (value.length < 6) {
      return ' Password should be greater then 6 digits';
    } else if (value != oldPassword) {
      return ' Confirm Password is not matched';
    }
    return null;
  }

  static String? isEmpty(String? value) {
    if (value!.isEmpty) {
      return ' Field cannot not be empty';
    }
    return null;
  }

  static String? isEmptyTitle(String? value) {
    if (value!.isEmpty) {
      return 'Title is required';
    }
    return null;
  }

  static String? isEmptyUserName(String? value, BuildContext context) {
    // Check if the value is empty
    if (value!.isEmpty) {
      return Languages.of(context)!.userNameIsRequired;
    }

    // Check if the value contains any digits
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return Languages.of(context)!.userNameCannotContainNumbers;  // Add this message in Languages
    }

    return null;
  }


  static String? number(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return null;
    } else if (value.length < 2) {
      return null;
    }
    return null;
  }

  static String? lessThen2(String? value) {
    return (value!.length < 2) ? ' Enter more then 1 characters' : null;
  }

  static String? lessThen3(String? value) {
    return (value!.length < 3) ? ' Enter more then 2 characters' : null;
  }

  static String? lessThen4(String? value) {
    return (value!.length < 4) ? ' Enter more then 3 characters' : null;
  }

  static String? lessThen5(String? value) {
    return (value!.length < 5) ? ' Enter more then 4 characters' : null;
  }

  static String? greaterThen(String? input, double compareWith) {
    return (double.parse(input ?? '0') < compareWith)
        ? ' New input must be greater'
        : null;
  }

  static String? returnNull(String? value) => null;
}
