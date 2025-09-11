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

  static String m0(count) => "Completed Projects: ${count}";

  static String m1(percent) => "${percent}%";

  static String m2(count) => "Uncompleted Projects: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Accept"),
    "airConditioning": MessageLookupByLibrary.simpleMessage("Air Conditioning"),
    "blacksmith": MessageLookupByLibrary.simpleMessage("Blacksmith"),
    "bookings_crafter": MessageLookupByLibrary.simpleMessage("Bookings"),
    "carpenter": MessageLookupByLibrary.simpleMessage("Carpenter"),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("Change Language"),
    "completedProjects": m0,
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "electrician": MessageLookupByLibrary.simpleMessage("Electrician"),
    "home_crafter": MessageLookupByLibrary.simpleMessage("Home"),
    "myServices": MessageLookupByLibrary.simpleMessage("My Services"),
    "newRequests": MessageLookupByLibrary.simpleMessage("New Requests"),
    "noNewRequests": MessageLookupByLibrary.simpleMessage("No new requests."),
    "painter": MessageLookupByLibrary.simpleMessage("Painter"),
    "plumber": MessageLookupByLibrary.simpleMessage("Plumber"),
    "profile_crafter": MessageLookupByLibrary.simpleMessage("Profile"),
    "progressPercent": m1,
    "reject": MessageLookupByLibrary.simpleMessage("Reject"),
    "service": MessageLookupByLibrary.simpleMessage("Service"),
    "serviceDetails": MessageLookupByLibrary.simpleMessage("Service Details"),
    "uncompletedProjects": m2,
    "yourProgress": MessageLookupByLibrary.simpleMessage("Your Progress"),
  };
}
