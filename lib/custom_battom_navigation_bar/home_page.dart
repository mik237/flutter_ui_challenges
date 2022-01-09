import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    firebaseOnMessage();
    firebaseOnBackground();
    super.initState();
  }

  void firebaseOnBackground(){
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  Future _onBackgroundMessage(RemoteMessage message)async{
    print("Title: ${message.notification?.title}\nBody: ${message.notification?.body}");
  }

  void firebaseOnMessage(){
    FirebaseMessaging.onMessage.listen((message) {
      print("onMessage");

      final title = message.notification?.title;
      final body = message.notification?.body;
      showDialog(context: context, builder: (context){
        return SimpleDialog(
          contentPadding: EdgeInsets.all(8.0),
          children: [
            Text("Title: $title"),
            Text("Body: $body"),
          ],
        );
      });

      /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Title: $title\nBody: $body")));*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Custom Animated Bottom Navigation Bar"),
        backgroundColor: Colors.green[200],
      ),
    );
  }
}
