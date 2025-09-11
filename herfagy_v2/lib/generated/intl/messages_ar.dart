// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(count) => "مشاريع مكتملة: ${count}";

  static String m1(percent) => "%${percent}";

  static String m2(count) => "غير مكتملة: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("قبول"),
    "airConditioning": MessageLookupByLibrary.simpleMessage("تكييف وتبريد"),
    "blacksmith": MessageLookupByLibrary.simpleMessage("حدادة"),
    "bookings_crafter": MessageLookupByLibrary.simpleMessage("الحجوزات"),
    "carpenter": MessageLookupByLibrary.simpleMessage("نجارة"),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
    "close": MessageLookupByLibrary.simpleMessage("إغلاق"),
    "completed": MessageLookupByLibrary.simpleMessage("مكتمل"),
    "completedProjects": m0,
    "craftsman": MessageLookupByLibrary.simpleMessage("الحرفي"),
    "customer": MessageLookupByLibrary.simpleMessage("العميل"),
    "date": MessageLookupByLibrary.simpleMessage("التاريخ"),
    "dateWithCalenderIcon": MessageLookupByLibrary.simpleMessage("التاريخ 📅"),
    "description": MessageLookupByLibrary.simpleMessage("الوصف"),
    "details": MessageLookupByLibrary.simpleMessage("التفاصيل"),
    "electrician": MessageLookupByLibrary.simpleMessage("كهرباء"),
    "home_crafter": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "inProgress": MessageLookupByLibrary.simpleMessage("قيد التنفيذ"),
    "myServices": MessageLookupByLibrary.simpleMessage("خدماتي"),
    "newOrder": MessageLookupByLibrary.simpleMessage("جديد"),
    "newRequests": MessageLookupByLibrary.simpleMessage("الطلبات الجديدة"),
    "noNewRequests": MessageLookupByLibrary.simpleMessage(
      "لا توجد طلبات جديدة.",
    ),
    "orders": MessageLookupByLibrary.simpleMessage("الطلبات"),
    "painter": MessageLookupByLibrary.simpleMessage("دهانات"),
    "plumber": MessageLookupByLibrary.simpleMessage("سباكة"),
    "profile_crafter": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "progressPercent": m1,
    "reject": MessageLookupByLibrary.simpleMessage("رفض"),
    "rejected": MessageLookupByLibrary.simpleMessage("مرفوض"),
    "service": MessageLookupByLibrary.simpleMessage("الخدمة"),
    "serviceDetails": MessageLookupByLibrary.simpleMessage("تفاصيل الخدمة"),
    "status": MessageLookupByLibrary.simpleMessage("الحالة"),
    "uncompletedProjects": m2,
    "yourProgress": MessageLookupByLibrary.simpleMessage("تقدمك"),
  };
}
