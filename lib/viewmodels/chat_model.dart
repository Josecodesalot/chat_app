import 'package:chatapp/models/chat.dart';
import 'package:chatapp/services/base_firebase.dart';
import 'package:flutter/cupertino.dart';

class ChatModel extends ChangeNotifier {
  ChatModel(this.api);

  ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();

  FirebaseService api;
  String _chatRoomId;
  List<Chat> _chatMessages = [];

  String get chatRoomId => _chatRoomId;

  List<Chat> get chatMessages => _chatMessages;

  set chatMessages(List<Chat> a) {
    _chatMessages = a;
    notifyListeners();
  }

  set chatRoomId(String a,) {
    _chatMessages = <Chat>[];
    _chatRoomId = a;
    api.subscribeToChats(chatRoomId).listen(
      (event) {
        var value = event.snapshot.value;

        if (value != null) {
          var map = Map.from(value);
          chatMessages = Chat.fromList(map);
          scrollController.animateTo(scrollController.position.maxScrollExtent + 50,
              duration: Duration(milliseconds: 250), curve: Curves.linear);
        }
      },
    );
    notifyListeners();
  }

  sendMessage(String uid) {
    api.sendChat(
        Chat(message: textController.text, time: DateTime.now(), uid: uid),
        chatRoomId);

    textController.text = "";
  }
}
