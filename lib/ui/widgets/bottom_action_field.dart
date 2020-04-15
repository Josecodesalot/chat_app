import 'package:chatapp/utils/common.dart';
import 'package:flutter/material.dart';

class BottomActionField extends StatelessWidget {
  final Function onPressed;
  final TextEditingController textEditingController;

  BottomActionField({this.onPressed, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.08,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
              ),
            ),

            SizedBox(width: cardPadding().left,),

            FloatingActionButton(
              heroTag: null,
              onPressed: onPressed,
              child: Icon(
                Icons.send,
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),

          ],
        ),
      ),
    );
  }
}
