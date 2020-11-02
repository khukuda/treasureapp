import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treasureapp/title.dart';
import 'package:treasureapp/menu.dart';
import 'package:treasureapp/about.dart';
import 'package:treasureapp/map.dart';
import 'package:treasureapp/map_g.dart';
import 'package:treasureapp/hunting.dart';
import 'package:treasureapp/result.dart';

import 'package:treasureapp/form/form0.dart';
import 'package:treasureapp/form/kiyaku.dart';
import 'package:treasureapp/form/form.dart';
import 'package:treasureapp/form/form_result.dart';

import 'package:treasureapp/map_2.dart';

void main() {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(MyApp());
  });*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treasure App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.brown,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CustomPageTransitionBuilder(),
          TargetPlatform.iOS: CustomPageTransitionBuilder(),
        }),
        fontFamily: "Tetu",
      ),
      home: TitlePage(),
      routes: <String, WidgetBuilder>{
        "/title": (BuildContext context) => TitlePage(),
        "/menu": (BuildContext context) => MenuPage(),
        "/about": (BuildContext context) => AboutPage(),
        "/map": (BuildContext context) => MapPage(),
        "/map_g": (BuildContext context) => MapGPage(),
        "/hunting": (BuildContext context) => HuntingPage(),
        "/result": (BuildContext context) => ResultPage(),
        "/form0": (BuildContext context) => FormStartPage(),
        "/kiyaku": (BuildContext context) => KiyakuPage(),
        "/form": (BuildContext context) => FormPage(),
        "/form_result": (BuildContext context) => FormResultPage(),
        "/map2": (BuildContext context) => Map2Page(),
      },
    );
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
