import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Radius cornerRadius(){
  return Radius.circular(18);
}

BorderRadius borderRadius ()=> BorderRadius.circular(24);


EdgeInsets cardPadding()=> EdgeInsets.all(16);
EdgeInsets chatMargin()=>  EdgeInsets.all(12);
EdgeInsets chatPadding()=> EdgeInsets.all(12);

Color  primary ()=> Colors.green;

Widget separator()=> Container(
  height: 1,
  color: Colors.grey[350],
);

TextStyle chatRoomTitle ()=> TextStyle(color: Colors.grey[800], fontSize: 16, fontWeight: FontWeight.w600);

TextStyle appBarTitle()=> TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);