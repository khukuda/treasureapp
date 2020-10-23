import "dart:async";
import "dart:isolate";
import "dart:ui";
import "dart:math";

import 'package:flutter/material.dart';
import 'package:geofencing/geofencing.dart';

class Map2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 90, 70, 10),
      body: Stack(children: [
        Center(
          child: Image.asset(
            "images/map_open.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 350,
          left: 60,
          child: Transform(
              transform: Matrix4.rotationZ(pi / 2),
              origin: Offset(100, 120),
              child: Image.asset(
                "images/character_game_mimic.png",
                fit: BoxFit.cover,
                scale: 6.5,
              )),
        ),
        Positioned(
            top: 20,
            left: 70,
            child: Transform(
                transform: Matrix4.rotationZ(pi / 2),
                child: FloatingActionButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () => {Navigator.of(context).pop()},
                )))
      ]),
    );
  }
}
