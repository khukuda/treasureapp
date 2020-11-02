import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/rendering.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter_compass/flutter_compass.dart';
import "package:geolocator/geolocator.dart";
import "package:treasureapp/treasurebox.dart";

class HuntingPage extends StatefulWidget {
  @override
  _HuntingState createState() => _HuntingState();
}

class _HuntingState extends State<HuntingPage> {
  static const int base_distance = 50; // (m)
  static const int base_accuracy = 30;

  bool _is_started = false;
  double _zero_compass = 0;
  double _compass = 0;
  List<double> _compassList = List<double>();

  Position _zero_position = null;
  Position _last_position = null;

  List<TreasureBox> boxes = List<TreasureBox>();

  ArCoreController controller;
  StreamSubscription<Position> positionStream;

  @override
  void initState() {
    super.initState();

    // 初期化
    boxes.add(TreasureBox("box1", 33.565220, 133.561518));
    boxes.add(TreasureBox("box2", 33.5654042, 133.5614302));
    boxes.add(TreasureBox("box3", 33.565270, 133.561719));
    boxes.add(TreasureBox("box4", 33.566529, 133.551169));

    FlutterCompass.events.listen(_onCompassData);

    positionStream = getPositionStream(
      desiredAccuracy: LocationAccuracy.best,
      //distanceFilter: 1,
    ).listen(_onGetPosition);
  }

  Future _resetPosition() async {
    Completer completer = Completer();
    _is_started = false;
    while (true) {
      await Future.delayed(Duration(seconds: 3));
      if (_compassList.length >= 10 && _last_position != null) {
        if (_compassList.reduce(max) - _compassList.reduce(min) < 10 &&
            _last_position.accuracy < base_accuracy) {
          break;
        }
      }
    }
    _zero_compass = _compass;
    _zero_position = _last_position;
    completer.complete();

    return completer.future;
  }

  void draw(position) {
    debugPrint("Current Position  lat: " +
        position.latitude.toString() +
        "   lon: " +
        position.longitude.toString() +
        "   acc: " +
        position.accuracy.toString());

    _addARTestNode();

    boxes.forEach((TreasureBox box) {
      box.resetPosition(
          _zero_position.latitude, _zero_position.longitude, _zero_compass);
      if (box.getDistance(position.latitude, position.longitude) <
          base_distance) {
        _addARTreasureBox(box);
      } else {
        _removeARTreasureBox(box);
      }
    });
  }

  void _onNodeTap(String name) {
    Navigator.of(context).pushReplacementNamed("/result");
  }

  void _addARTestNode() {
    controller.removeNode(nodeName: "TestNode");

    final node = ArCoreReferenceNode(
      name: "TestNode",
      //objectUrl: 'https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf',
      //object3DFileName: "andy.sfb",
      object3DFileName: "treasurechest01.sfb",
      //object3DFileName: "t01.sfb",
      scale: vector.Vector3.all(2),
      position: vector.Vector3(0, -2, -3),
      //rotation: vector.Vector4(0, 3, 0, 0),
    );

    controller.addArCoreNode(node);
  }

  void _addARTreasureBox(TreasureBox box) {
    controller.removeNode(nodeName: box.name);
    /*
    final material = ArCoreMaterial(
      color: Color.fromARGB(255, 66, 184, 244),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 1.0,
    );
    final node = ArCoreNode(
      shape: sphere,
      name: box.name,
      position: vector.Vector3(box.x, -1, box.z),
    );
    */

    final node = ArCoreReferenceNode(
      name: box.name,
      object3DFileName: "treasurechest2.sfb",
      scale: vector.Vector3.all(3),
      position: vector.Vector3(box.x, -2, box.z),
    );

    controller.addArCoreNode(node);
    //controller.addArCoreNodeWithAnchor(node);
  }

  void _removeARTreasureBox(TreasureBox box) {
    controller.removeNode(nodeName: box.name);
  }

  void _onGetPosition(Position position) {
    double acc = position.accuracy;
    if (position.accuracy < base_accuracy + 5) {
      _last_position = position;
      if (_zero_position == null) {
        _zero_position = _last_position;
        _zero_compass = _compass;
      }
      if (_is_started) {
        draw(position);
      }
    }
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    this.controller = controller;
    this.controller.onNodeTap = _onNodeTap;
    _is_started = true;
    //_addSphere();

    //_addARTestNode();
  }

  void _onCompassData(double data) {
    debugPrint("On Compass: " + data.toString());
    _compass = data;
    _compassList.add(data);
    if (_compassList.length > 10) {
      _compassList.removeAt(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("さがす"),
      ),
      body: Center(
        child: FutureBuilder(
          future: _resetPosition(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 位置情報取得完了
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 240.0,
                        ),
                        child: CircularProgressIndicator()),
                    Container(
                      child: Text("\n付近の宝箱を探しています...\n（スマートフォンを動かさないでね）",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ],
                ),
              );
            } else {
              // 未
              return Stack(
                children: <Widget>[
                  ArCoreView(
                    onArCoreViewCreated: _onArCoreViewCreated,
                    enableTapRecognizer: true,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (controller != null) {
      controller.dispose();
    }
    super.dispose();
  }
}
