import 'package:flutter/material.dart';

class ChatRoom {
  ChatRoom({this.id, @required this.name});

  String id;
  String name;

  Map toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory ChatRoom.fromMap(Map map) {

    return  ChatRoom(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  static List<ChatRoom> fromListMap(Map data) {
    var list = <ChatRoom>[];

    if(data==null){
      return list;
    }

    data.values.forEach((element) {
      list.add(ChatRoom.fromMap(element));
    });

    return list;
  }
}
