import 'package:animations/animations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/sample_flutter_map.dart';
import 'package:intro_screens/pages/intro_screens.dart';
import 'package:restaurant_side_menu/home/home_screen.dart';
import 'cookie_store/cookie_store_home.dart';
import 'staggered_animation.dart';
import 'custom_battom_navigation_bar/home_page.dart';
import 'healthy_food_ui.dart';
import 'slivers_demo/slivers_demo.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_web/webview_flutter_web.dart';

void main() async{
  // WebView.platform = WebWebViewPlatform();
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
      // home: SliversDemo(),
      // home: HealthyFoodUI(),
      // home: WebviewSample(),
      // home: PrinterDemo(),
      // home: StaggerDemo(),
      home: CookieStoreHome(),
    );
  }
}
