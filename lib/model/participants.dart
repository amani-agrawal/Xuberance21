class Participant {
  late int contactNum;
  late String name;

  Participant({required this.contactNum, required this.name});

  static bool isValidNumber(int n) {
    return n.toString().length == 10;
  }

  static Participant fromJson(Map<String, Object?> json) {
    return Participant(
      contactNum: json['contact_num']! as int,
      name: json['name']! as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'contact_num': this.contactNum,
      'name': name,
    };
  }
}
