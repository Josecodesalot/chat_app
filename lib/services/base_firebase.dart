import 'package:chatapp/models/chat.dart';
import 'package:chatapp/models/chat_room.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class BaseFirebase {
  Future<String> signInAnon();

  createChat(ChatRoom chatRoom);

  Stream<Event> subscribeToChats(String chatRoomId);

  sendChat(Chat chat, String chatRoomId);

  Stream<Event> subscribeToChatRooms();
}

class FirebaseService implements BaseFirebase {
  @override
  createChat(ChatRoom chatRoom) async {
    var ref = FirebaseDatabase.instance.reference().child("chat_room");
    String chatKey = ref.push().key;
    chatRoom.id = chatKey;

    try {
      await ref.child(chatKey).set(chatRoom.toMap());
    } catch (e) {
      print("createChat Error: $e");
    }
  }

  @override
  sendChat(Chat chat, String chatRoomId) async {

    var ref = FirebaseDatabase.instance.reference().child("chats");
    chat.id = ref.push().key;

    try {
      var map = chat.toMap();
      await ref.child(chatRoomId).child(chat.id).set(map);

    } catch (e) {
      print("sendChat Error: $e");
    }
  }

  @override
  Stream<Event> subscribeToChats(String chatRoomId){
    var ref = FirebaseDatabase.instance.reference().child("chats");
    return ref.child(chatRoomId).onValue;
  }

  @override
  Future<String> signInAnon() async {
    var authResult = await FirebaseAuth.instance.signInAnonymously();
    return authResult.user.uid;
  }

  @override
  Stream<Event>subscribeToChatRooms() {
    return FirebaseDatabase.instance.reference().child("chat_room").onValue;
  }
}
