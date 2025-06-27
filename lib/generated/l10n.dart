// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `App Name`
  String get appName {
    return Intl.message(
      'App Name',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `User Name ,Status Real state .....`
  String get searchHint {
    return Intl.message(
      'User Name ,Status Real state .....',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Admin Name`
  String get adminName {
    return Intl.message(
      'Admin Name',
      name: 'adminName',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get homeScreen {
    return Intl.message(
      'Home Screen',
      name: 'homeScreen',
      desc: '',
      args: [],
    );
  }

  /// `Manage Sales Units`
  String get manageSalesUnits {
    return Intl.message(
      'Manage Sales Units',
      name: 'manageSalesUnits',
      desc: '',
      args: [],
    );
  }

  /// `Manage Partial Rent Units`
  String get managePartialRentUnits {
    return Intl.message(
      'Manage Partial Rent Units',
      name: 'managePartialRentUnits',
      desc: '',
      args: [],
    );
  }

  /// `Manage Full Rent Units`
  String get manageFullRentUnits {
    return Intl.message(
      'Manage Full Rent Units',
      name: 'manageFullRentUnits',
      desc: '',
      args: [],
    );
  }

  /// `Manage Users`
  String get manageUsers {
    return Intl.message(
      'Manage Users',
      name: 'manageUsers',
      desc: '',
      args: [],
    );
  }

  /// `Provide Support`
  String get provideSupport {
    return Intl.message(
      'Provide Support',
      name: 'provideSupport',
      desc: '',
      args: [],
    );
  }

  /// `Send Notification`
  String get sendNotification {
    return Intl.message(
      'Send Notification',
      name: 'sendNotification',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Pending Requests : `
  String get pending {
    return Intl.message(
      'Pending Requests : ',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Unit Number`
  String get unitNumber {
    return Intl.message(
      'Unit Number',
      name: 'unitNumber',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Owner Name`
  String get ownerName {
    return Intl.message(
      'Owner Name',
      name: 'ownerName',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Actions`
  String get actions {
    return Intl.message(
      'Actions',
      name: 'actions',
      desc: '',
      args: [],
    );
  }

  /// `Unit Data`
  String get unitData {
    return Intl.message(
      'Unit Data',
      name: 'unitData',
      desc: '',
      args: [],
    );
  }

  /// `Contact Data`
  String get contactData {
    return Intl.message(
      'Contact Data',
      name: 'contactData',
      desc: '',
      args: [],
    );
  }

  /// `Cairo`
  String get cityCairo {
    return Intl.message(
      'Cairo',
      name: 'cityCairo',
      desc: '',
      args: [],
    );
  }

  /// `Fifth Settlement`
  String get districtTagamoa {
    return Intl.message(
      'Fifth Settlement',
      name: 'districtTagamoa',
      desc: '',
      args: [],
    );
  }

  /// `First Floor`
  String get firstFloor {
    return Intl.message(
      'First Floor',
      name: 'firstFloor',
      desc: '',
      args: [],
    );
  }

  /// `3 Rooms`
  String get rooms3 {
    return Intl.message(
      '3 Rooms',
      name: 'rooms3',
      desc: '',
      args: [],
    );
  }

  /// `Detailed Address`
  String get detailedAddress {
    return Intl.message(
      'Detailed Address',
      name: 'detailedAddress',
      desc: '',
      args: [],
    );
  }

  /// `Cairo - Fifth Settlement - First Floor - First Room`
  String get fullAddress {
    return Intl.message(
      'Cairo - Fifth Settlement - First Floor - First Room',
      name: 'fullAddress',
      desc: '',
      args: [],
    );
  }

  /// `Unit Price: {price}`
  String unitPrice(Object price) {
    return Intl.message(
      'Unit Price: $price',
      name: 'unitPrice',
      desc: '',
      args: [price],
    );
  }

  /// `Free Wi-Fi`
  String get freeWifi {
    return Intl.message(
      'Free Wi-Fi',
      name: 'freeWifi',
      desc: '',
      args: [],
    );
  }

  /// `Private Garage`
  String get privateGarage {
    return Intl.message(
      'Private Garage',
      name: 'privateGarage',
      desc: '',
      args: [],
    );
  }

  /// `24/7 Security`
  String get security247 {
    return Intl.message(
      '24/7 Security',
      name: 'security247',
      desc: '',
      args: [],
    );
  }

  /// `Immediate Housing`
  String get immediateHousing {
    return Intl.message(
      'Immediate Housing',
      name: 'immediateHousing',
      desc: '',
      args: [],
    );
  }

  /// `Fully Finished`
  String get fullyFinished {
    return Intl.message(
      'Fully Finished',
      name: 'fullyFinished',
      desc: '',
      args: [],
    );
  }

  /// `Ready for Delivery`
  String get readyForDelivery {
    return Intl.message(
      'Ready for Delivery',
      name: 'readyForDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Installments Available for 3 Years`
  String get installmentsAvailable {
    return Intl.message(
      'Installments Available for 3 Years',
      name: 'installmentsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Down Payment {amount} EGP`
  String downPayment(Object amount) {
    return Intl.message(
      'Down Payment $amount EGP',
      name: 'downPayment',
      desc: '',
      args: [amount],
    );
  }

  /// `Client Name`
  String get clientName {
    return Intl.message(
      'Client Name',
      name: 'clientName',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed`
  String get mohamed {
    return Intl.message(
      'Mohamed',
      name: 'mohamed',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed`
  String get ahmed {
    return Intl.message(
      'Ahmed',
      name: 'ahmed',
      desc: '',
      args: [],
    );
  }

  /// `Add your note here`
  String get addNoteHere {
    return Intl.message(
      'Add your note here',
      name: 'addNoteHere',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
