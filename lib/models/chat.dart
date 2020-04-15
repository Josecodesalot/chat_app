class Chat {
  String id;
  DateTime time;
  String uid;
  String message;

  Chat({
    this.id,
    this.time,
    this.uid,
    this.message,
  });

  Map toMap() {
    return {
      'id': this.id,
      'time': this.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'uid': this.uid,
      'message': this.message,
    };
  }

  factory Chat.fromMap(Map map) {
    return map == null
        ? null
        : Chat(
            id: map['id'] as String,
            time: DateTime.fromMillisecondsSinceEpoch(map['time']),
            uid: map['uid'] as String,
            message: map['message'] as String,
          );
  }



  static List<Chat> fromList(Map map) {
    if (map == null) {
      return <Chat>[];
    }

    var list = <Chat>[];

    map.values.forEach(
      (element) {
        list.add(Chat.fromMap(element));
      }
    );

    list.sort((a, b) => a.time.millisecondsSinceEpoch.compareTo(b.time.millisecondsSinceEpoch));
    return list;
  }
}
