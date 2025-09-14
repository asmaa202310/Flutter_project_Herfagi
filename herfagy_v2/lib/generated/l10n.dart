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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Bookings`
  String get bookings {
    return Intl.message('Bookings', name: 'bookings', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Your Progress`
  String get yourProgress {
    return Intl.message(
      'Your Progress',
      name: 'yourProgress',
      desc: '',
      args: [],
    );
  }

  /// `{percent}%`
  String progressPercent(Object percent) {
    return Intl.message(
      '$percent%',
      name: 'progressPercent',
      desc: '',
      args: [percent],
    );
  }

  /// `Completed Projects: {count}`
  String completedProjects(Object count) {
    return Intl.message(
      'Completed Projects: $count',
      name: 'completedProjects',
      desc: '',
      args: [count],
    );
  }

  /// `Uncompleted Projects: {count}`
  String uncompletedProjects(Object count) {
    return Intl.message(
      'Uncompleted Projects: $count',
      name: 'uncompletedProjects',
      desc: '',
      args: [count],
    );
  }

  /// `Electrician`
  String get electrician {
    return Intl.message('Electrician', name: 'electrician', desc: '', args: []);
  }

  /// `Carpenter`
  String get carpenter {
    return Intl.message('Carpenter', name: 'carpenter', desc: '', args: []);
  }

  /// `Plumber`
  String get plumber {
    return Intl.message('Plumber', name: 'plumber', desc: '', args: []);
  }

  /// `Painter`
  String get painter {
    return Intl.message('Painter', name: 'painter', desc: '', args: []);
  }

  /// `Air Conditioning`
  String get airConditioning {
    return Intl.message(
      'Air Conditioning',
      name: 'airConditioning',
      desc: '',
      args: [],
    );
  }

  /// `Blacksmith`
  String get blacksmith {
    return Intl.message('Blacksmith', name: 'blacksmith', desc: '', args: []);
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `My Services`
  String get myServices {
    return Intl.message('My Services', name: 'myServices', desc: '', args: []);
  }

  /// `New Requests`
  String get newRequests {
    return Intl.message(
      'New Requests',
      name: 'newRequests',
      desc: '',
      args: [],
    );
  }

  /// `No new requests.`
  String get noNewRequests {
    return Intl.message(
      'No new requests.',
      name: 'noNewRequests',
      desc: '',
      args: [],
    );
  }

  /// `Service Details`
  String get serviceDetails {
    return Intl.message(
      'Service Details',
      name: 'serviceDetails',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message('Service', name: 'service', desc: '', args: []);
  }

  /// `Customer`
  String get customer {
    return Intl.message('Customer', name: 'customer', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message('In Progress', name: 'inProgress', desc: '', args: []);
  }

  /// `New`
  String get newOrder {
    return Intl.message('New', name: 'newOrder', desc: '', args: []);
  }

  /// `Rejected`
  String get rejected {
    return Intl.message('Rejected', name: 'rejected', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Craftsman`
  String get craftsman {
    return Intl.message('Craftsman', name: 'craftsman', desc: '', args: []);
  }

  /// `📅 Date`
  String get dateWithCalenderIcon {
    return Intl.message(
      '📅 Date',
      name: 'dateWithCalenderIcon',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Hello {name} 👋`
  String greetingMessage(Object name) {
    return Intl.message(
      'Hello $name 👋',
      name: 'greetingMessage',
      desc: '',
      args: [name],
    );
  }

  /// `How can we help you today?`
  String get helpMessage {
    return Intl.message(
      'How can we help you today?',
      name: 'helpMessage',
      desc: '',
      args: [],
    );
  }

  /// `Search for a service or crafter...`
  String get searchForCrafterPlaceholder {
    return Intl.message(
      'Search for a service or crafter...',
      name: 'searchForCrafterPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Search for a client or explore the crafters...`
  String get searchForCustomerPlaceholder {
    return Intl.message(
      'Search for a client or explore the crafters...',
      name: 'searchForCustomerPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get sectionCategories {
    return Intl.message(
      'Categories',
      name: 'sectionCategories',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated`
  String get sectionTopRated {
    return Intl.message(
      'Top Rated',
      name: 'sectionTopRated',
      desc: '',
      args: [],
    );
  }

  /// `Popular Services`
  String get sectionPopularServices {
    return Intl.message(
      'Popular Services',
      name: 'sectionPopularServices',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Make your life easier with the Herfagy app`
  String get onboardingDesc1 {
    return Intl.message(
      'Make your life easier with the Herfagy app',
      name: 'onboardingDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Trusted services - ratings and reviews build confidence`
  String get onboardingDesc2 {
    return Intl.message(
      'Trusted services - ratings and reviews build confidence',
      name: 'onboardingDesc2',
      desc: '',
      args: [],
    );
  }

  /// `All crafters in one place - request or provide your service easily`
  String get onboardingDesc3 {
    return Intl.message(
      'All crafters in one place - request or provide your service easily',
      name: 'onboardingDesc3',
      desc: '',
      args: [],
    );
  }

  /// `Choose account type`
  String get chooseAccountType {
    return Intl.message(
      'Choose account type',
      name: 'chooseAccountType',
      desc: '',
      args: [],
    );
  }

  /// `Please choose an account type to continue`
  String get pleaseChooseAccountType {
    return Intl.message(
      'Please choose an account type to continue',
      name: 'pleaseChooseAccountType',
      desc: '',
      args: [],
    );
  }

  /// `Crafter / Specialist`
  String get crafterAccount {
    return Intl.message(
      'Crafter / Specialist',
      name: 'crafterAccount',
      desc: '',
      args: [],
    );
  }

  /// `For crafters and service providers`
  String get crafterAccountDescription {
    return Intl.message(
      'For crafters and service providers',
      name: 'crafterAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Regular User / Customer`
  String get userAccount {
    return Intl.message(
      'Regular User / Customer',
      name: 'userAccount',
      desc: '',
      args: [],
    );
  }

  /// `For clients looking for services`
  String get userAccountDescription {
    return Intl.message(
      'For clients looking for services',
      name: 'userAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message('Welcome!', name: 'welcome', desc: '', args: []);
  }

  /// `Login`
  String get loginTitle {
    return Intl.message('Login', name: 'loginTitle', desc: '', args: []);
  }

  /// `Email`
  String get emailLabel {
    return Intl.message('Email', name: 'emailLabel', desc: '', args: []);
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message('Password', name: 'passwordLabel', desc: '', args: []);
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Don't have an account ?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Forgot Password ?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password ?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get orSignInWith {
    return Intl.message(
      'Or sign in with',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get enterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your username`
  String get enterUsername {
    return Intl.message(
      'Please enter your username',
      name: 'enterUsername',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get signUpTitle {
    return Intl.message(
      'Create a new account',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameLabel {
    return Intl.message('Name', name: 'nameLabel', desc: '', args: []);
  }

  /// `Enter your full name`
  String get nameHint {
    return Intl.message(
      'Enter your full name',
      name: 'nameHint',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordLabel {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get confirmPasswordHint {
    return Intl.message(
      'Re-enter your password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get createAccountButton {
    return Intl.message(
      'Sign Up',
      name: 'createAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password ?`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forgot your password ?',
      name: 'forgetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email and we will send you a link to reset your password.`
  String get forgetPasswordDesc {
    return Intl.message(
      'Please enter your email and we will send you a link to reset your password.',
      name: 'forgetPasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `Send Link`
  String get sendResetLinkButton {
    return Intl.message(
      'Send Link',
      name: 'sendResetLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `Remembered your password ?`
  String get rememberPassword {
    return Intl.message(
      'Remembered your password ?',
      name: 'rememberPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get invalidEmailFormat {
    return Intl.message(
      'Invalid email format',
      name: 'invalidEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `at least 8 characters`
  String get passwordMinChars {
    return Intl.message(
      'at least 8 characters',
      name: 'passwordMinChars',
      desc: '',
      args: [],
    );
  }

  /// `one uppercase letter`
  String get passwordUppercase {
    return Intl.message(
      'one uppercase letter',
      name: 'passwordUppercase',
      desc: '',
      args: [],
    );
  }

  /// `one lowercase letter`
  String get passwordLowercase {
    return Intl.message(
      'one lowercase letter',
      name: 'passwordLowercase',
      desc: '',
      args: [],
    );
  }

  /// `one number`
  String get passwordNumber {
    return Intl.message(
      'one number',
      name: 'passwordNumber',
      desc: '',
      args: [],
    );
  }

  /// `one special character`
  String get passwordSpecialChar {
    return Intl.message(
      'one special character',
      name: 'passwordSpecialChar',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain {errors}`
  String passwordMustContain(Object errors) {
    return Intl.message(
      'Password must contain $errors',
      name: 'passwordMustContain',
      desc: '',
      args: [errors],
    );
  }

  /// `Update Password`
  String get updatePasswordTitle {
    return Intl.message(
      'Update Password',
      name: 'updatePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your new password.`
  String get updatePasswordDesc {
    return Intl.message(
      'Please enter your new password.',
      name: 'updatePasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordLabel {
    return Intl.message(
      'New Password',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get newPasswordHint {
    return Intl.message(
      'Enter your new password',
      name: 'newPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmButton {
    return Intl.message('Confirm', name: 'confirmButton', desc: '', args: []);
  }

  /// `Password changed successfully`
  String get passwordChangedSuccess {
    return Intl.message(
      'Password changed successfully',
      name: 'passwordChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message('Book Now', name: 'bookNow', desc: '', args: []);
  }

  /// `{price} EGP`
  String priceWithCurrency(Object price) {
    return Intl.message(
      '$price EGP',
      name: 'priceWithCurrency',
      desc: '',
      args: [price],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message('My Account', name: 'myAccount', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure you want to log out of your account?`
  String get logoutConfirmation {
    return Intl.message(
      'Are you sure you want to log out of your account?',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `You have logged out successfully`
  String get logoutSuccess {
    return Intl.message(
      'You have logged out successfully',
      name: 'logoutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpSupport {
    return Intl.message(
      'Help & Support',
      name: 'helpSupport',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Security`
  String get privacySecurity {
    return Intl.message(
      'Privacy & Security',
      name: 'privacySecurity',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `General Settings`
  String get generalSettings {
    return Intl.message(
      'General Settings',
      name: 'generalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `All Works`
  String get allWorks {
    return Intl.message('All Works', name: 'allWorks', desc: '', args: []);
  }

  /// `Gallery`
  String get galleryTitle {
    return Intl.message('Gallery', name: 'galleryTitle', desc: '', args: []);
  }

  /// `No works added yet`
  String get noWorksYet {
    return Intl.message(
      'No works added yet',
      name: 'noWorksYet',
      desc: '',
      args: [],
    );
  }

  /// `Add images now`
  String get addImagesNow {
    return Intl.message(
      'Add images now',
      name: 'addImagesNow',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo`
  String get takePhoto {
    return Intl.message('Take a photo', name: 'takePhoto', desc: '', args: []);
  }

  /// `Choose from gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Reviews & Ratings`
  String get reviewsAndRatings {
    return Intl.message(
      'Reviews & Ratings',
      name: 'reviewsAndRatings',
      desc: '',
      args: [],
    );
  }

  /// `No Reviews Yet`
  String get noReviewsYet {
    return Intl.message(
      'No Reviews Yet',
      name: 'noReviewsYet',
      desc: '',
      args: [],
    );
  }

  /// `No photo added yet`
  String get noPhotosYet {
    return Intl.message(
      'No photo added yet',
      name: 'noPhotosYet',
      desc: '',
      args: [],
    );
  }

  /// `Herfagy`
  String get appName {
    return Intl.message('Herfagy', name: 'appName', desc: '', args: []);
  }

  /// `All your home services in one place`
  String get tagLine {
    return Intl.message(
      'All your home services in one place',
      name: 'tagLine',
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
