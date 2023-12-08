import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<ScheduleStruct>? initialSchedule() {
  final List<ScheduleStruct> schedule = [];

  final List<String> week = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  for (final day in week) {
    schedule.add(ScheduleStruct(week: day, startTime: null, endTime: null));
  }

  return schedule;
}

List<DateTime>? getAvailableSlots(
  List<DateTime> database,
  DateTime dateArg,
  List<ScheduleStruct> schedule,
) {
  final matchingSchedule = schedule
      .where((a) =>
          a.week.toLowerCase() ==
          DateFormat('EEEE').format(dateArg).toLowerCase())
      .toList();

// Next, we need to create a list of DateTime objects representing the half-hourly blocks between the start and end times of each matching DayOfWeekWithTimeStruct object.
  final availableSlots = <DateTime>[];
  for (final a in matchingSchedule) {
    if (a.hasStartTime() && a.hasEndTime()) {
      final startHour = a.startTime!.hour;
      final endHour = a.endTime!.hour;
      for (var i = startHour; i <= endHour; i++) {
        availableSlots
            .add(DateTime(dateArg.year, dateArg.month, dateArg.day, i));
      }
    }
  }

  // Finally, we need to filter out any DateTime objects that match the bookings list.
  final availableSlotsFiltered = availableSlots
      .where((slot) => !database.any((booking) =>
          booking.hour == slot.hour &&
          booking.day == slot.day &&
          booking.month == slot.month &&
          booking.year == slot.year))
      .toList();

  DateTime now = DateTime.now();

  return availableSlotsFiltered.where((slot) => slot.isAfter(now)).toList();
}

DateTime? stringtoTime(
  String? hourArg,
  DateTime? dateArg,
) {
  // output the combination of dateArg and hourArg (HH: mm format)
  if (hourArg == null || dateArg == null) {
    return null;
  }
  final hourMin = hourArg.split(':');
  final hour = int.tryParse(hourMin[0]) ?? 0;
  final minute = int.tryParse(hourMin[1]) ?? 0;
  return DateTime(dateArg.year, dateArg.month, dateArg.day, hour, minute);
}
