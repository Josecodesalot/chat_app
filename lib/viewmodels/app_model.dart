import 'package:chatapp/services/base_firebase.dart';
import 'package:chatapp/utils/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  AppModel(this.api) {
    api.signInAnon().then((value) => uid = value);
  }

  String uid;
  FirebaseService api;

  ThemeData _themeData = ThemeData(
    primaryColor: primary(),
    accentColor: Colors.blueAccent,
    scaffoldBackgroundColor: primary(),
  );

  ThemeData get themeData => _themeData;

  set themeData(ThemeData a) {
    _themeData = a;
    notifyListeners();
  }
}
