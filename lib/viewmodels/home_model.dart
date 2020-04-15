import 'package:chatapp/models/chat_room.dart';
import 'package:chatapp/services/base_firebase.dart';
import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  HomeModel(this.api) {
    api.subscribeToChatRooms().listen((event) {
      var data = Map.from(event.snapshot.value);
      chatRooms = ChatRoom.fromListMap(data);
    });
  }

  FirebaseService api;
  TextEditingController homeEditingController = TextEditingController();

  List<ChatRoom> _chatRooms = [];

  List<ChatRoom> get chatRooms => _chatRooms;
  CreateChatState get createChatState => _createChatState;


  set createChatState(CreateChatState a) {
    _createChatState = a;
    notifyListeners();
  }

  set chatRooms(List<ChatRoom> a) {
    _chatRooms = a;
    notifyListeners();
  }


  CreateChatState _createChatState = CreateChatState.inactive;

  void createChat() async {
    await api.createChat(ChatRoom(name: homeEditingController.text));
    createChatState = CreateChatState.inactive;
    homeEditingController.text="";
  }
}

enum CreateChatState {
  inactive,
  active,
}
