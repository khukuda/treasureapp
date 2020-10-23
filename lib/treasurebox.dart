import 'dart:math';

import 'package:flutter/foundation.dart';
import "package:geolocator/geolocator.dart";
import 'package:vector_math/vector_math_64.dart' as vector;

/**
 * 
 */
class TreasureBox {
  String name = "";
  double _latitude = 0;
  double _longitude = 0;
  double x = 0;
  double z = 0;

  TreasureBox(this.name, this._latitude, this._longitude);

  /**
   * 
   */
  void resetPosition(double latitude, double longitude, double compass){
    double dist = distanceBetween(latitude, longitude, _latitude, _longitude);
    double bear = bearingBetween(latitude, longitude, _latitude, _longitude);
    double bear360 = (bear<0?360+bear:bear);

    double rotation = 0;
    //double rotation = toRadians(bear) - _radians;
    rotation = bear360 - compass;
    if( rotation < 0 ) rotation = 360 + rotation;
    rotation = 360 + 90 - rotation;
    if( rotation >= 360 ) rotation = rotation - 360;
    debugPrint("Target Position  dist: " + dist.toString() + "  rot: " + rotation.toString());

    z = (-1 * dist * sin(vector.radians(rotation)));
    x = ( dist * cos(vector.radians(rotation)));
    debugPrint("Target Position x: " + x.toString() + "  z: " + z.toString());
  }

  /**
   * 
   */
  double getDistance(double latitude, double longitude){
    double dist = distanceBetween(latitude, longitude, _latitude, _longitude);

    return dist;
  }
}