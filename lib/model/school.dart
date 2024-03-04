import 'dart:collection';

import 'package:xuberance2021/model/participants.dart';

import 'event.dart';

// TODO(xuberance-gh): Get all event details and complete the entire `Map<String,Event>`.
// Map of identifier name to `Event` instance.
final Map<String, Event> NAME_TO_EVENT_MAP = {
  'x_meme': Event(
    name: "X-Meme",
    rules: "TBD",
    category: EventCategory.recorded,
    grade: Grade.nineToTwelve,
    phrase: "TBD",
    description: "TBD",
    start: DateTime(1),
    end: DateTime(1),
    numberOfParticipants: 1,
  ),
};
// Map of identifier name to display name.
const Map<String, String> EVENT_NAMES = {
  'x_meme': 'X-Meme',
};

class School {
  late final String name;
  late final Map<Event, List<Participant>> eventParticipantsMap;

  School({
    required this.name,
    required this.eventParticipantsMap,
  });

  School fromJson(Map<String, Object?> json) {
    return School(
      name: json['name']! as String,
      eventParticipantsMap: _getMapFromJson(
        json['event_participants_map']! as Map<String, Object?>,
      ),
    );
  }

  Map<Event, List<Participant>> _getMapFromJson(Map<String, Object?> json) {
    List<Map<String, Object?>> listOfEventAndParticipants =
        json.values as List<Map<String, Object?>>;

    HashMap<Event, List<Participant>> result = HashMap();

    for (Map<String, Object?> eventAndParticipants
        in listOfEventAndParticipants) {
      String eventName = eventAndParticipants['event_name']! as String;
      List<Map<String, Object?>> listOfParticipants =
          eventAndParticipants['participants']! as List<Map<String, Object?>>;

      List<Participant> typedList =
          listOfParticipants.map(Participant.fromJson).toList();

      result[NAME_TO_EVENT_MAP[eventName]!] = typedList;
    }

    return result;
  }
}
