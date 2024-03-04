import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Event {
  final DateTime start;
  final DateTime end;
// Note: Firestore document key is the name of event as well as a field named `name` is present.
  final String name;
  final String rules;
  final EventCategory category;
  final Grade grade;
  final int numberOfParticipants;

  /// Catchphrase to be displayed in the events page.
  final String phrase;

  /// Short description in a few words for the schedule page.
  final String description;

  const Event({
    required this.name,
    required this.category,
    required this.description,
    required this.rules,
    required this.phrase,
    required this.start,
    required this.end,
    required this.grade,
    required this.numberOfParticipants,
  });

  Event fromJson(Map<String, Object?> json) {
    return Event(
      name: json['name']! as String,
      rules: json['rules']! as String,
      numberOfParticipants: json['number_of_participants']! as int,
      description: json['description']! as String,
      phrase: json['phrase']! as String,
      grade: _getGradeFromString(json['grade']! as String),
      category: _getCategoryFromString(json['category']! as String),
      start: (json['start']! as Timestamp).toDate(),
      end: (json['end']! as Timestamp).toDate(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': this.name,
      'rules': this.rules,
      'number_of_participants': this.numberOfParticipants,
      'description': this.description,
      'phrase': this.phrase,
      'grade': this.grade.toString(),
      'category': this.category.toString(),
      'start': Timestamp.fromDate(this.start),
      'end': Timestamp.fromDate(this.end),
    };
  }

  Grade _getGradeFromString(String s) {
    if (s == "sixToEight") {
      return Grade.sixToEight;
    } else if (s == "fourToFive") {
      return Grade.fourToFive;
    } else if (s == "nineToTwelve") {
      return Grade.nineToTwelve;
    } else {
      debugPrint("Incorrect grade string value- " + s);
      return Grade.nineToTwelve;
    }
  }

  EventCategory _getCategoryFromString(String s) {
    if (s == "recorded") {
      return EventCategory.recorded;
    } else if (s == "live") {
      return EventCategory.live;
    } else if (s == "streaming") {
      return EventCategory.streaming;
    } else if (s == "gaming") {
      return EventCategory.gaming;
    } else {
      debugPrint("Incorrect category string value- " + s);
      return EventCategory.recorded;
    }
  }
}

enum EventCategory { recorded, streaming, live, gaming }

enum Grade { fourToFive, sixToEight, nineToTwelve }
