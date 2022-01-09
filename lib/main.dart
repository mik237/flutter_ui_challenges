import 'package:animations/animations.dart';
import 'package:customized_google_map/customized_google_map.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/sample_flutter_map.dart';
import 'package:intro_screens/pages/intro_screens.dart';
import 'package:restaurant_side_menu/home/home_screen.dart';
import 'package:customized_google_map/flutter_map_sample.dart';

import 'custom_battom_navigation_bar/home_page.dart';
import 'slivers_demo/slivers_demo.dart';

void main() async{
  runApp(MyApp());
  // await FirebaseMessaging.instance.getToken().then((token) => print("Token:( $token )"));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomeScreen(),
      // home: IntroScreen(),
      // home: MapScreen(),
      // home: AnimationsSample(),
      // home: SampleFlutterMap(),
      // home: HomePage(),
      home: SliversDemo(),
    );
  }
}
