import "dart:async";
import "dart:isolate";
import "dart:ui";
import "dart:math";

import 'package:flutter/material.dart';
import 'package:geofencing/geofencing.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 90, 70, 10),
        body: Stack(children: [
          GestureDetector(
            child: Container(
              constraints: BoxConstraints.expand(),
              child: Transform(
                transform: Matrix4.rotationZ(0.0),
                child: Image.asset(
                  "images/map_1.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed("/map_g"),
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
        ]));
  }
}
