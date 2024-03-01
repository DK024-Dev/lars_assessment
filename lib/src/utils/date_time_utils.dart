import 'dart:developer';

import 'package:intl/intl.dart';

//custom dateFormate
String customDateFormat(
  DateTime dateTime, {
  DateFormat? dateFormat,
  bool isUtc = false,
  bool isAWSDateFormat = false,
}) {
  try {
    if (isAWSDateFormat) {
      DateFormat format = DateFormat("yyyy-MM-dd");
      return format.format(dateTime);
    } else if (isUtc) {
      DateFormat format = DateFormat("dd/MM/yyyy");
      return format.format(dateTime);
    } else {
      DateFormat format = dateFormat ?? DateFormat("dd-MM-yyyy");
      return format.format(dateTime);
    }
  } catch (e) {
    return e.toString();
  }
}

DateTime? convertStringToDateTime(
  String dateTime, {
  DateFormat? dateFormat,
  bool isAWSDateFormat = false,
}) {
  try {
    if (isAWSDateFormat) {
      DateFormat format = DateFormat("yyyy-MM-dd");
      return format.parse(dateTime);
    }
    DateFormat format = dateFormat ?? DateFormat("dd-MM-yyyy");
    return format.parse(dateTime);
  } catch (e) {
    log("convertStringToDateTime:$e");
  }
  return null;
}

//dateTime
String getParsedOrDate(String value) {
  try {
    final date = DateTime.parse(value);
    return customDateFormat(date);
  } catch (_) {
    return value;
  }
}
