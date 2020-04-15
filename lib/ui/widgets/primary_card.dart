import 'package:chatapp/utils/common.dart';
import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;

  PrimaryCard({
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(

      child: Padding(padding: padding ?? cardPadding(), child: child),
      elevation: 2,
      borderRadius:
          BorderRadius.only(topLeft: cornerRadius(), topRight: cornerRadius()),
    );
  }
}
