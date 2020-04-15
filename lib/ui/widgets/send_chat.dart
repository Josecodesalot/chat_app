import 'package:chatapp/ui/widgets/bottom_action_field.dart';
import 'package:chatapp/utils/common.dart';
import 'package:chatapp/viewmodels/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateChat extends StatelessWidget {
  final Widget child;

  CreateChat({this.child});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context, listen: true);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(child: child),

        Align(
            alignment: Alignment.bottomRight,
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: cardPadding(),
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: buildCreateChatWidget(context, model)),
              ),
            ))
      ],
    );
  }

  Widget buildCreateChatWidget(BuildContext context, HomeModel model) {
    var width = MediaQuery.of(context).size.width;

    var floatingActionButton = FloatingActionButton(
      onPressed: () => model.createChatState = CreateChatState.active,
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add),
    );

    switch (model.createChatState) {
      case CreateChatState.inactive:
        return Container(
            height: 100,
            width: width,
            alignment: Alignment.bottomRight,
            child: floatingActionButton);
        break;
      case CreateChatState.active:
        return Container(
          child: BottomActionField(
            textEditingController: model.homeEditingController,
            onPressed: () {
              model.createChat();
            },
          ),
        );
        break;
    }
    return Container(height: 0, width: 0);
  }
}
