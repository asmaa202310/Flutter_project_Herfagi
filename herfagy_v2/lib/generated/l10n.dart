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
  String get home_crafter {
    return Intl.message('Home', name: 'home_crafter', desc: '', args: []);
  }

  /// `Bookings`
  String get bookings_crafter {
    return Intl.message(
      'Bookings',
      name: 'bookings_crafter',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_crafter {
    return Intl.message('Profile', name: 'profile_crafter', desc: '', args: []);
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
