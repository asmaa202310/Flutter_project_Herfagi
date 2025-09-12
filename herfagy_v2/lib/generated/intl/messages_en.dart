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

  static String m1(name) => "Hello ${name} 👋";

  static String m2(errors) => "Password must contain ${errors}";

  static String m3(percent) => "${percent}%";

  static String m4(count) => "Uncompleted Projects: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Accept"),
    "airConditioning": MessageLookupByLibrary.simpleMessage("Air Conditioning"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "blacksmith": MessageLookupByLibrary.simpleMessage("Blacksmith"),
    "bookings_crafter": MessageLookupByLibrary.simpleMessage("Bookings"),
    "carpenter": MessageLookupByLibrary.simpleMessage("Carpenter"),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("Change Language"),
    "chooseAccountType": MessageLookupByLibrary.simpleMessage(
      "Choose account type",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "completedProjects": m0,
    "confirmButton": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPasswordHint": MessageLookupByLibrary.simpleMessage(
      "Re-enter your password",
    ),
    "confirmPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "crafterAccount": MessageLookupByLibrary.simpleMessage(
      "Crafter / Specialist",
    ),
    "crafterAccountDescription": MessageLookupByLibrary.simpleMessage(
      "For crafters and service providers",
    ),
    "craftsman": MessageLookupByLibrary.simpleMessage("Craftsman"),
    "createAccountButton": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "dateWithCalenderIcon": MessageLookupByLibrary.simpleMessage("📅 Date"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "details": MessageLookupByLibrary.simpleMessage("Details"),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account ?",
    ),
    "electrician": MessageLookupByLibrary.simpleMessage("Electrician"),
    "emailHint": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Email is required"),
    "enterEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "enterPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter your password",
    ),
    "enterUsername": MessageLookupByLibrary.simpleMessage(
      "Please enter your username",
    ),
    "forgetPasswordDesc": MessageLookupByLibrary.simpleMessage(
      "Please enter your email and we will send you a link to reset your password.",
    ),
    "forgetPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Forgot your password ?",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password ?"),
    "greetingMessage": m1,
    "helpMessage": MessageLookupByLibrary.simpleMessage(
      "How can we help you today?",
    ),
    "home_crafter": MessageLookupByLibrary.simpleMessage("Home"),
    "inProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
    "invalidEmailFormat": MessageLookupByLibrary.simpleMessage(
      "Invalid email format",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
    "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
    "myServices": MessageLookupByLibrary.simpleMessage("My Services"),
    "nameHint": MessageLookupByLibrary.simpleMessage("Enter your full name"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("Name"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("Name is required"),
    "newOrder": MessageLookupByLibrary.simpleMessage("New"),
    "newPasswordHint": MessageLookupByLibrary.simpleMessage(
      "Enter your new password",
    ),
    "newPasswordLabel": MessageLookupByLibrary.simpleMessage("New Password"),
    "newRequests": MessageLookupByLibrary.simpleMessage("New Requests"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "noNewRequests": MessageLookupByLibrary.simpleMessage("No new requests."),
    "onboardingDesc1": MessageLookupByLibrary.simpleMessage(
      "Make your life easier with the Herfagy app",
    ),
    "onboardingDesc2": MessageLookupByLibrary.simpleMessage(
      "Trusted services - ratings and reviews build confidence",
    ),
    "onboardingDesc3": MessageLookupByLibrary.simpleMessage(
      "All crafters in one place - request or provide your service easily",
    ),
    "orSignInWith": MessageLookupByLibrary.simpleMessage("Or sign in with"),
    "orders": MessageLookupByLibrary.simpleMessage("Orders"),
    "painter": MessageLookupByLibrary.simpleMessage("Painter"),
    "passwordChangedSuccess": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully",
    ),
    "passwordHint": MessageLookupByLibrary.simpleMessage("Enter your password"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordLowercase": MessageLookupByLibrary.simpleMessage(
      "one lowercase letter",
    ),
    "passwordMinChars": MessageLookupByLibrary.simpleMessage(
      "at least 8 characters",
    ),
    "passwordMustContain": m2,
    "passwordNumber": MessageLookupByLibrary.simpleMessage("one number"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordSpecialChar": MessageLookupByLibrary.simpleMessage(
      "one special character",
    ),
    "passwordUppercase": MessageLookupByLibrary.simpleMessage(
      "one uppercase letter",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "pleaseChooseAccountType": MessageLookupByLibrary.simpleMessage(
      "Please choose an account type to continue",
    ),
    "plumber": MessageLookupByLibrary.simpleMessage("Plumber"),
    "profile_crafter": MessageLookupByLibrary.simpleMessage("Profile"),
    "progressPercent": m3,
    "reject": MessageLookupByLibrary.simpleMessage("Reject"),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "rememberPassword": MessageLookupByLibrary.simpleMessage(
      "Remembered your password ?",
    ),
    "searchForCrafterPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Search for a service or crafter...",
    ),
    "searchForCustomerPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Search for a client or explore the crafters...",
    ),
    "sectionCategories": MessageLookupByLibrary.simpleMessage("Categories"),
    "sectionPopularServices": MessageLookupByLibrary.simpleMessage(
      "Popular Services",
    ),
    "sectionTopRated": MessageLookupByLibrary.simpleMessage("Top Rated"),
    "sendResetLinkButton": MessageLookupByLibrary.simpleMessage("Send Link"),
    "service": MessageLookupByLibrary.simpleMessage("Service"),
    "serviceDetails": MessageLookupByLibrary.simpleMessage("Service Details"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signUpTitle": MessageLookupByLibrary.simpleMessage("Create a new account"),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "uncompletedProjects": m4,
    "updatePasswordDesc": MessageLookupByLibrary.simpleMessage(
      "Please enter your new password.",
    ),
    "updatePasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Update Password",
    ),
    "userAccount": MessageLookupByLibrary.simpleMessage(
      "Regular User / Customer",
    ),
    "userAccountDescription": MessageLookupByLibrary.simpleMessage(
      "For clients looking for services",
    ),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome!"),
    "yourProgress": MessageLookupByLibrary.simpleMessage("Your Progress"),
  };
}
