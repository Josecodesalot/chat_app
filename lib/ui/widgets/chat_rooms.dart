import 'package:chatapp/ui/chat_view.dart';
import 'package:chatapp/utils/common.dart';
import 'package:chatapp/viewmodels/chat_model.dart';
import 'package:chatapp/viewmodels/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ChatRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context, listen:true);

    return ListView.builder(
      itemCount: model.chatRooms.length,
      itemBuilder: (_,i){
        return _chatTitle(_,i);
      },
    );
  }

  Widget _chatTitle(BuildContext context, int i) {
    final model = Provider.of<HomeModel>(context, listen:false);
    final chatModel = Provider.of<ChatModel>(context, listen:false);

    var chatRoom = model.chatRooms[i];
    return GestureDetector(
      onTap: (){

        chatModel.chatRoomId = chatRoom.id;
        Navigator.push(context, PageTransition(type:PageTransitionType.fade,child:  ChatView(chatRoom)));

      },

      child: Container(
        padding: EdgeInsets.only(bottom: 16),
        child:

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(chatRoom.name, style: chatRoomTitle()),
                    Icon(Icons.keyboard_arrow_right, color: Colors.grey[600],)
                  ],
                ),

                const SizedBox(height:16,),

                separator(),

              ],
            ),
      ),
    );
  }
}



