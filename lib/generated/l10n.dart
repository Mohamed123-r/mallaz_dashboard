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
