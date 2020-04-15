import 'package:chatapp/models/chat_room.dart';
import 'package:chatapp/ui/widgets/bottom_action_field.dart';
import 'package:chatapp/ui/widgets/chat_room.dart';
import 'package:chatapp/ui/widgets/primary_card.dart';
import 'package:chatapp/viewmodels/app_model.dart';
import 'package:chatapp/viewmodels/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  final ChatRoom chat;

  ChatView(this.chat);

  @override
  Widget build(BuildContext context) {
    
    final model = Provider.of<ChatModel>(context, listen:false);
    final appModel = Provider.of<AppModel>(context, listen:false);

    return Scaffold(
      appBar: AppBar(
        title: Text("${chat.name}"),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ChatRoomWidget(),
          ),
          Hero(
            tag: "card",
            child: PrimaryCard(
              child: BottomActionField(
                textEditingController: model.textController,
                onPressed: () {
                  model.sendMessage(appModel.uid);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
