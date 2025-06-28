// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "All (${count})";

  static String m1(count) => "Available (${count})";

  static String m2(amount) => "Down Payment ${amount} EGP";

  static String m3(count) => "Pending (${count})";

  static String m4(count) => "Sold (${count})";

  static String m5(count) => "Under Inspection (${count})";

  static String m6(price) => "Unit Price: ${price}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "accountStatus": MessageLookupByLibrary.simpleMessage("Account Status"),
        "actions": MessageLookupByLibrary.simpleMessage("Actions"),
        "active": MessageLookupByLibrary.simpleMessage("Active"),
        "addNoteHere":
            MessageLookupByLibrary.simpleMessage("Add your note here"),
        "addRecuist": MessageLookupByLibrary.simpleMessage("Add Requests"),
        "addedDate": MessageLookupByLibrary.simpleMessage("Added Date"),
        "adminName": MessageLookupByLibrary.simpleMessage("Admin Name"),
        "ahmed": MessageLookupByLibrary.simpleMessage("Ahmed"),
        "alexandria": MessageLookupByLibrary.simpleMessage("Alexandria"),
        "allUnits": m0,
        "apartmentOrRoom":
            MessageLookupByLibrary.simpleMessage("Apartment/Room"),
        "appName": MessageLookupByLibrary.simpleMessage("App Name"),
        "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
        "available": m1,
        "availableShort": MessageLookupByLibrary.simpleMessage("Available"),
        "blockUser": MessageLookupByLibrary.simpleMessage("Block User"),
        "cityCairo": MessageLookupByLibrary.simpleMessage("Cairo"),
        "clientName": MessageLookupByLibrary.simpleMessage("Client Name"),
        "contactData": MessageLookupByLibrary.simpleMessage("Contact Data"),
        "detailedAddress":
            MessageLookupByLibrary.simpleMessage("Detailed Address"),
        "districtTagamoa":
            MessageLookupByLibrary.simpleMessage("Fifth Settlement"),
        "downPayment": m2,
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "firstFloor": MessageLookupByLibrary.simpleMessage("First Floor"),
        "forSale": MessageLookupByLibrary.simpleMessage("For Sale"),
        "freeWifi": MessageLookupByLibrary.simpleMessage("Free Wi-Fi"),
        "fullAddress": MessageLookupByLibrary.simpleMessage(
            "Cairo - Fifth Settlement - First Floor - First Room"),
        "fullyFinished": MessageLookupByLibrary.simpleMessage("Fully Finished"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "governorate": MessageLookupByLibrary.simpleMessage("Governorate"),
        "homeScreen": MessageLookupByLibrary.simpleMessage("Home Screen"),
        "immediateHousing":
            MessageLookupByLibrary.simpleMessage("Immediate Housing"),
        "inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
        "installmentsAvailable": MessageLookupByLibrary.simpleMessage(
            "Installments Available for 3 Years"),
        "languages": MessageLookupByLibrary.simpleMessage("Languages"),
        "logIn": MessageLookupByLibrary.simpleMessage("Log In"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log Out"),
        "mainFacilities":
            MessageLookupByLibrary.simpleMessage("Main Facilities"),
        "manageFullRentUnits":
            MessageLookupByLibrary.simpleMessage("Manage Full Rent Units"),
        "managePartialRentUnits":
            MessageLookupByLibrary.simpleMessage("Manage Partial Rent Units"),
        "manageSalesUnits":
            MessageLookupByLibrary.simpleMessage("Manage Sales Units"),
        "manageUsers": MessageLookupByLibrary.simpleMessage("Manage Users"),
        "mobileNumber": MessageLookupByLibrary.simpleMessage("Mobile Number"),
        "mohamed": MessageLookupByLibrary.simpleMessage("Mohamed"),
        "newUsersCount":
            MessageLookupByLibrary.simpleMessage("New Users Count"),
        "ownerName": MessageLookupByLibrary.simpleMessage("Owner Name"),
        "partialRent": MessageLookupByLibrary.simpleMessage("Partial Rent"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "pending": MessageLookupByLibrary.simpleMessage("Pending Requests : "),
        "pending1": m3,
        "pendingShort": MessageLookupByLibrary.simpleMessage("Pending"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "privateGarage": MessageLookupByLibrary.simpleMessage("Private Garage"),
        "propertyDetails":
            MessageLookupByLibrary.simpleMessage("Property Details"),
        "propertyType": MessageLookupByLibrary.simpleMessage("Property Type"),
        "provideSupport":
            MessageLookupByLibrary.simpleMessage("Provide Support"),
        "readyForDelivery":
            MessageLookupByLibrary.simpleMessage("Ready for Delivery"),
        "reject": MessageLookupByLibrary.simpleMessage("Reject"),
        "rent": MessageLookupByLibrary.simpleMessage("Rent"),
        "requestsCount": MessageLookupByLibrary.simpleMessage("Requests Count"),
        "rooms3": MessageLookupByLibrary.simpleMessage("3 Rooms"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "searchHint": MessageLookupByLibrary.simpleMessage(
            "User Name ,Status Real state ....."),
        "security247": MessageLookupByLibrary.simpleMessage("24/7 Security"),
        "sendNotification":
            MessageLookupByLibrary.simpleMessage("Send Notification"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "showMore": MessageLookupByLibrary.simpleMessage("Show More"),
        "sold": m4,
        "soldShort": MessageLookupByLibrary.simpleMessage("Sold"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "unblock": MessageLookupByLibrary.simpleMessage("Unblock"),
        "underInspection": m5,
        "underInspectionShort":
            MessageLookupByLibrary.simpleMessage("Under Inspection"),
        "unitData": MessageLookupByLibrary.simpleMessage("Unit Data"),
        "unitNumber": MessageLookupByLibrary.simpleMessage("Unit Number"),
        "unitPrice": m6,
        "unitType": MessageLookupByLibrary.simpleMessage("Unit Type"),
        "userName": MessageLookupByLibrary.simpleMessage("User Name"),
        "villa": MessageLookupByLibrary.simpleMessage("Villa")
      };
}
