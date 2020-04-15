import 'package:chatapp/utils/common.dart';
import 'package:chatapp/viewmodels/app_model.dart';
import 'package:chatapp/viewmodels/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatRoomWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var yourRadius = BorderRadius.only(
      topLeft: cornerRadius(),
      bottomLeft: cornerRadius(),
      bottomRight: cornerRadius(),
    );

    var theirRadius = BorderRadius.only(
      topRight: cornerRadius(),
      bottomLeft: cornerRadius(),
      bottomRight: cornerRadius(),
    );

    final model = Provider.of<ChatModel>(context, listen:true);
    final appModel = Provider.of<AppModel>(context, listen:true);


    return ListView.builder(
      controller: model.scrollController,
        itemCount: model.chatMessages.length,
        itemBuilder: (_, i) {
          var chat = model.chatMessages[i];

          bool yours = appModel.uid == chat.uid;

          return Align(
            alignment: yours?Alignment.topRight:Alignment.topLeft,
            child: Container(
              padding:chatPadding(),
              margin: chatMargin(),
              child: Text(chat.message),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: yours? yourRadius: theirRadius,
              ),
            ),
          );
        });
  }
}
