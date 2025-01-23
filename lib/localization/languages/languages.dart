// ignore_for_file non_constant_identifier_names
import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  ///Common
  String get instantBooking;
  String get serviceSelection;
  String get next;
  String get back;
  String get barberSelection;
  String get availableTime;
  String get proceedWithAny;
  String get customerDetails;
  String get fullName;
  String get emailAddress;
  String get writeSomeThingAboutYou;
  String get enterMobileNumber;

  String get userNameIsRequired;
  String get emailIsRequired;
  String get pleaseEnterValidEmail;
  String get descriptionIsRequired;
  String get phoneNumberIsRequired;
  String get phoneNumberShouldNotBeLessThanSixDigits;
  String get userNameCannotContainNumbers;
  String get norBarberAvailableForRequiredService;
  String get pleaseSelectServices;
  String get pleaseEnterPhoneNumber;
  String get pleaseEnterValidPhoneNumber ;
  String get addingCustomer;






}
