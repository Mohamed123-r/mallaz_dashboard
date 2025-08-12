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

  /// `ملاذ`
  String get appName {
    return Intl.message(
      'ملاذ',
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

  /// `Search by full username...`
  String get searchHint {
    return Intl.message(
      'Search by full username...',
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

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Search by unit ID...`
  String get searchId {
    return Intl.message(
      'Search by unit ID...',
      name: 'searchId',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out of the app?`
  String get logoutQua {
    return Intl.message(
      'Do you want to log out of the app?',
      name: 'logoutQua',
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

  /// `Manage Rent Units`
  String get manageFullRentUnits {
    return Intl.message(
      'Manage Rent Units',
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

  /// `Admin Management`
  String get adminManagement {
    return Intl.message(
      'Admin Management',
      name: 'adminManagement',
      desc: '',
      args: [],
    );
  }

  /// `Admin Details`
  String get adminDetails {
    return Intl.message(
      'Admin Details',
      name: 'adminDetails',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
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

  /// `For Sale`
  String get forSale {
    return Intl.message(
      'For Sale',
      name: 'forSale',
      desc: '',
      args: [],
    );
  }

  /// `Partial Rent`
  String get partialRent {
    return Intl.message(
      'Partial Rent',
      name: 'partialRent',
      desc: '',
      args: [],
    );
  }

  /// `Rent`
  String get rent {
    return Intl.message(
      'Rent',
      name: 'rent',
      desc: '',
      args: [],
    );
  }

  /// `Requests Count`
  String get requestsCount {
    return Intl.message(
      'Requests Count',
      name: 'requestsCount',
      desc: '',
      args: [],
    );
  }

  /// `Property Type`
  String get propertyType {
    return Intl.message(
      'Property Type',
      name: 'propertyType',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get governorate {
    return Intl.message(
      'Governorate',
      name: 'governorate',
      desc: '',
      args: [],
    );
  }

  /// `Added Date`
  String get addedDate {
    return Intl.message(
      'Added Date',
      name: 'addedDate',
      desc: '',
      args: [],
    );
  }

  /// `Apartment/Room`
  String get apartmentOrRoom {
    return Intl.message(
      'Apartment/Room',
      name: 'apartmentOrRoom',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria`
  String get alexandria {
    return Intl.message(
      'Alexandria',
      name: 'alexandria',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get showMore {
    return Intl.message(
      'Show More',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Add Requests`
  String get addRecuist {
    return Intl.message(
      'Add Requests',
      name: 'addRecuist',
      desc: '',
      args: [],
    );
  }

  /// `Property Details`
  String get propertyDetails {
    return Intl.message(
      'Property Details',
      name: 'propertyDetails',
      desc: '',
      args: [],
    );
  }

  /// `Main Facilities`
  String get mainFacilities {
    return Intl.message(
      'Main Facilities',
      name: 'mainFacilities',
      desc: '',
      args: [],
    );
  }

  /// `Users Count`
  String get newUsersCount {
    return Intl.message(
      'Users Count',
      name: 'newUsersCount',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Account Status`
  String get accountStatus {
    return Intl.message(
      'Account Status',
      name: 'accountStatus',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get inactive {
    return Intl.message(
      'Inactive',
      name: 'inactive',
      desc: '',
      args: [],
    );
  }

  /// `Unblock`
  String get unblock {
    return Intl.message(
      'Unblock',
      name: 'unblock',
      desc: '',
      args: [],
    );
  }

  /// `Block User`
  String get blockUser {
    return Intl.message(
      'Block User',
      name: 'blockUser',
      desc: '',
      args: [],
    );
  }

  /// `All ({count})`
  String allUnits(Object count) {
    return Intl.message(
      'All ($count)',
      name: 'allUnits',
      desc: '',
      args: [count],
    );
  }

  /// `Available ({count})`
  String available(Object count) {
    return Intl.message(
      'Available ($count)',
      name: 'available',
      desc: '',
      args: [count],
    );
  }

  /// `Pending ({count})`
  String pending1(Object count) {
    return Intl.message(
      'Pending ($count)',
      name: 'pending1',
      desc: '',
      args: [count],
    );
  }

  /// `Under Inspection ({count})`
  String underInspection(Object count) {
    return Intl.message(
      'Under Inspection ($count)',
      name: 'underInspection',
      desc: '',
      args: [count],
    );
  }

  /// `Sold ({count})`
  String sold(Object count) {
    return Intl.message(
      'Sold ($count)',
      name: 'sold',
      desc: '',
      args: [count],
    );
  }

  /// `Unit Type`
  String get unitType {
    return Intl.message(
      'Unit Type',
      name: 'unitType',
      desc: '',
      args: [],
    );
  }

  /// `Villa`
  String get villa {
    return Intl.message(
      'Villa',
      name: 'villa',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get availableShort {
    return Intl.message(
      'Available',
      name: 'availableShort',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pendingShort {
    return Intl.message(
      'Pending',
      name: 'pendingShort',
      desc: '',
      args: [],
    );
  }

  /// `Under Inspection`
  String get underInspectionShort {
    return Intl.message(
      'Under Inspection',
      name: 'underInspectionShort',
      desc: '',
      args: [],
    );
  }

  /// `Sold`
  String get soldShort {
    return Intl.message(
      'Sold',
      name: 'soldShort',
      desc: '',
      args: [],
    );
  }

  /// `All Rooms ({count})`
  String allRooms(Object count) {
    return Intl.message(
      'All Rooms ($count)',
      name: 'allRooms',
      desc: '',
      args: [count],
    );
  }

  /// `Single Rooms Only ({count})`
  String singleRoomsOnly(Object count) {
    return Intl.message(
      'Single Rooms Only ($count)',
      name: 'singleRoomsOnly',
      desc: '',
      args: [count],
    );
  }

  /// `With Empty Beds ({count})`
  String withEmptyBeds(Object count) {
    return Intl.message(
      'With Empty Beds ($count)',
      name: 'withEmptyBeds',
      desc: '',
      args: [count],
    );
  }

  /// `Full ({count})`
  String fullRooms(Object count) {
    return Intl.message(
      'Full ($count)',
      name: 'fullRooms',
      desc: '',
      args: [count],
    );
  }

  /// `Room Number`
  String get roomNumber {
    return Intl.message(
      'Room Number',
      name: 'roomNumber',
      desc: '',
      args: [],
    );
  }

  /// `Room Type`
  String get roomType {
    return Intl.message(
      'Room Type',
      name: 'roomType',
      desc: '',
      args: [],
    );
  }

  /// `Rented Beds`
  String get rentedBeds {
    return Intl.message(
      'Rented Beds',
      name: 'rentedBeds',
      desc: '',
      args: [],
    );
  }

  /// `Empty Beds`
  String get emptyBeds {
    return Intl.message(
      'Empty Beds',
      name: 'emptyBeds',
      desc: '',
      args: [],
    );
  }

  /// `Shared`
  String get shared {
    return Intl.message(
      'Shared',
      name: 'shared',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Rented`
  String get rented {
    return Intl.message(
      'Rented',
      name: 'rented',
      desc: '',
      args: [],
    );
  }

  /// `Partially Rented`
  String get partialRented {
    return Intl.message(
      'Partially Rented',
      name: 'partialRented',
      desc: '',
      args: [],
    );
  }

  /// `Full`
  String get full {
    return Intl.message(
      'Full',
      name: 'full',
      desc: '',
      args: [],
    );
  }

  /// `Contract Expiring ({count})`
  String contractExpiring(Object count) {
    return Intl.message(
      'Contract Expiring ($count)',
      name: 'contractExpiring',
      desc: '',
      args: [count],
    );
  }

  /// `Rented ({count})`
  String rentedUnits(Object count) {
    return Intl.message(
      'Rented ($count)',
      name: 'rentedUnits',
      desc: '',
      args: [count],
    );
  }

  /// `Contract Expiring`
  String get contractExpiringShort {
    return Intl.message(
      'Contract Expiring',
      name: 'contractExpiringShort',
      desc: '',
      args: [],
    );
  }

  /// `Rented`
  String get rentedShort {
    return Intl.message(
      'Rented',
      name: 'rentedShort',
      desc: '',
      args: [],
    );
  }

  /// `Contract Duration`
  String get contractDuration {
    return Intl.message(
      'Contract Duration',
      name: 'contractDuration',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get role {
    return Intl.message(
      'Role',
      name: 'role',
      desc: '',
      args: [],
    );
  }

  /// `Last Login`
  String get lastLogin {
    return Intl.message(
      'Last Login',
      name: 'lastLogin',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `New Notification Form`
  String get newNotificationForm {
    return Intl.message(
      'New Notification Form',
      name: 'newNotificationForm',
      desc: '',
      args: [],
    );
  }

  /// `Notification Title`
  String get notificationTitle {
    return Intl.message(
      'Notification Title',
      name: 'notificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter notification title`
  String get enterNotificationTitle {
    return Intl.message(
      'Enter notification title',
      name: 'enterNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notification Text`
  String get notificationText {
    return Intl.message(
      'Notification Text',
      name: 'notificationText',
      desc: '',
      args: [],
    );
  }

  /// `Enter notification text`
  String get enterNotificationText {
    return Intl.message(
      'Enter notification text',
      name: 'enterNotificationText',
      desc: '',
      args: [],
    );
  }

  /// `Select Target Group`
  String get selectTargetGroup {
    return Intl.message(
      'Select Target Group',
      name: 'selectTargetGroup',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message(
      'Students',
      name: 'students',
      desc: '',
      args: [],
    );
  }

  /// `Families`
  String get families {
    return Intl.message(
      'Families',
      name: 'families',
      desc: '',
      args: [],
    );
  }

  /// `Tenants`
  String get tenants {
    return Intl.message(
      'Tenants',
      name: 'tenants',
      desc: '',
      args: [],
    );
  }

  /// `Send Time`
  String get sendTime {
    return Intl.message(
      'Send Time',
      name: 'sendTime',
      desc: '',
      args: [],
    );
  }

  /// `Send Now`
  String get sendNow {
    return Intl.message(
      'Send Now',
      name: 'sendNow',
      desc: '',
      args: [],
    );
  }

  /// `Schedule Notification`
  String get scheduleNotification {
    return Intl.message(
      'Schedule Notification',
      name: 'scheduleNotification',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Previous Notifications`
  String get previousNotifications {
    return Intl.message(
      'Previous Notifications',
      name: 'previousNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get rooms {
    return Intl.message(
      'Rooms',
      name: 'rooms',
      desc: '',
      args: [],
    );
  }

  /// `Bathrooms`
  String get bathrooms {
    return Intl.message(
      'Bathrooms',
      name: 'bathrooms',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Send Date`
  String get sendDate {
    return Intl.message(
      'Send Date',
      name: 'sendDate',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get group {
    return Intl.message(
      'Group',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `Add New Admin`
  String get addNewAdmin {
    return Intl.message(
      'Add New Admin',
      name: 'addNewAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get sent {
    return Intl.message(
      'Sent',
      name: 'sent',
      desc: '',
      args: [],
    );
  }

  /// `Target Group`
  String get targetGroup {
    return Intl.message(
      'Target Group',
      name: 'targetGroup',
      desc: '',
      args: [],
    );
  }

  /// `No users found`
  String get noUsersFound {
    return Intl.message(
      'No users found',
      name: 'noUsersFound',
      desc: '',
      args: [],
    );
  }

  /// `Total Units`
  String get totalUnits {
    return Intl.message(
      'Total Units',
      name: 'totalUnits',
      desc: '',
      args: [],
    );
  }

  /// `Sold Units`
  String get soldUnits {
    return Intl.message(
      'Sold Units',
      name: 'soldUnits',
      desc: '',
      args: [],
    );
  }

  /// `Rented Units`
  String get rentedUnits1 {
    return Intl.message(
      'Rented Units',
      name: 'rentedUnits1',
      desc: '',
      args: [],
    );
  }

  /// `Empty Units`
  String get emptyUnits {
    return Intl.message(
      'Empty Units',
      name: 'emptyUnits',
      desc: '',
      args: [],
    );
  }

  /// `All Users`
  String get allUsers {
    return Intl.message(
      'All Users',
      name: 'allUsers',
      desc: '',
      args: [],
    );
  }

  /// `Blocked Users`
  String get blockedUsers {
    return Intl.message(
      'Blocked Users',
      name: 'blockedUsers',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Furnished`
  String get furnished {
    return Intl.message(
      'Furnished',
      name: 'furnished',
      desc: '',
      args: [],
    );
  }

  /// `Bathroom`
  String get bathroom {
    return Intl.message(
      'Bathroom',
      name: 'bathroom',
      desc: '',
      args: [],
    );
  }

  /// `For Sale or Rent`
  String get forSaleOrRent {
    return Intl.message(
      'For Sale or Rent',
      name: 'forSaleOrRent',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get noDataAvailable {
    return Intl.message(
      'No data available',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Rent Type`
  String get rentType {
    return Intl.message(
      'Rent Type',
      name: 'rentType',
      desc: '',
      args: [],
    );
  }

  /// `No media available`
  String get noMediaAvailable {
    return Intl.message(
      'No media available',
      name: 'noMediaAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred: {error}`
  String errorOccurred(Object error) {
    return Intl.message(
      'An error occurred: $error',
      name: 'errorOccurred',
      desc: '',
      args: [error],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Changes Saved `
  String get changesSaved {
    return Intl.message(
      'Changes Saved ',
      name: 'changesSaved',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this item?`
  String get confirmDeleteMessage {
    return Intl.message(
      'Are you sure you want to delete this item?',
      name: 'confirmDeleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while loading media`
  String get mediaLoadError {
    return Intl.message(
      'An error occurred while loading media',
      name: 'mediaLoadError',
      desc: '',
      args: [],
    );
  }

  /// `This screen is not supported at the moment, the display must be larger than 1200px`
  String get screenNotSupported {
    return Intl.message(
      'This screen is not supported at the moment, the display must be larger than 1200px',
      name: 'screenNotSupported',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Operation completed successfully!`
  String get success {
    return Intl.message(
      'Operation completed successfully!',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred: `
  String get error {
    return Intl.message(
      'An error occurred: ',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `m²`
  String get m {
    return Intl.message(
      'm²',
      name: 'm',
      desc: '',
      args: [],
    );
  }

  /// `Video initialization error for`
  String get videoError {
    return Intl.message(
      'Video initialization error for',
      name: 'videoError',
      desc: '',
      args: [],
    );
  }

  /// `This unit does not exist`
  String get unit_exist {
    return Intl.message(
      'This unit does not exist',
      name: 'unit_exist',
      desc: '',
      args: [],
    );
  }

  /// `Select a user to view the chat`
  String get select_chat {
    return Intl.message(
      'Select a user to view the chat',
      name: 'select_chat',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing Chat`
  String get currentChat {
    return Intl.message(
      'Ongoing Chat',
      name: 'currentChat',
      desc: '',
      args: [],
    );
  }

  /// `Delete Message`
  String get delete_massage {
    return Intl.message(
      'Delete Message',
      name: 'delete_massage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this message?`
  String get delete_massage_confirmation {
    return Intl.message(
      'Are you sure you want to delete this message?',
      name: 'delete_massage_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `No messages yet`
  String get no_message {
    return Intl.message(
      'No messages yet',
      name: 'no_message',
      desc: '',
      args: [],
    );
  }

  /// `User Message`
  String get user_message {
    return Intl.message(
      'User Message',
      name: 'user_message',
      desc: '',
      args: [],
    );
  }

  /// `Edit Note`
  String get editNote {
    return Intl.message(
      'Edit Note',
      name: 'editNote',
      desc: '',
      args: [],
    );
  }

  /// `Add New Note`
  String get addNote {
    return Intl.message(
      'Add New Note',
      name: 'addNote',
      desc: '',
      args: [],
    );
  }

  /// ` No notes available`
  String get notNote {
    return Intl.message(
      ' No notes available',
      name: 'notNote',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all required fields`
  String get fillAllFields {
    return Intl.message(
      'Please fill in all required fields',
      name: 'fillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Notification sent successfully`
  String get notificationSentSuccessfully {
    return Intl.message(
      'Notification sent successfully',
      name: 'notificationSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get noDataFound {
    return Intl.message(
      'No data found',
      name: 'noDataFound',
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
