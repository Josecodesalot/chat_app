import 'package:chatapp/services/base_firebase.dart';
import 'package:chatapp/ui/home_view.dart';
import 'package:chatapp/viewmodels/app_model.dart';
import 'package:chatapp/viewmodels/chat_model.dart';
import 'package:chatapp/viewmodels/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main()=> runApp(ProviderStep());

class ProviderStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var api = FirebaseService();

    return MultiProvider(
      providers:[
        ChangeNotifierProvider<AppModel>.value(value: AppModel(api)),
        ChangeNotifierProvider<HomeModel>.value(value: HomeModel(api)),
        ChangeNotifierProvider<ChatModel>.value(value: ChatModel(api)),
      ],
      child: ChatApp(),
    );
  }
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppModel>(context);
    return MaterialApp(
      theme: model.themeData,
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}



