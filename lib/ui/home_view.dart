import 'package:chatapp/ui/widgets/chat_rooms.dart';
import 'package:chatapp/ui/widgets/primary_card.dart';
import 'package:chatapp/ui/widgets/send_chat.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return CreateChat(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose A room"),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),

        body: Hero(
          tag: "card",
          child: PrimaryCard(
            child: Container(
              height: height * 0.85,
              child: ChatRooms(),
            ),
          ),
        ),
      ),
    );
  }
}
