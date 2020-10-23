import "dart:async";
import "dart:isolate";
import "dart:ui";
import "dart:math";

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:geofencing/geofencing.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地図"),
      ),
      body: MapGWidget(),
    );
  }
}

class MapGWidget extends StatefulWidget {
  @override
  State<MapGWidget> createState() => MapSampleState();
}

class MapSampleState extends State<MapGWidget> {
  Completer<GoogleMapController> _controller = Completer();

  String _mapstyle;
  BitmapDescriptor _markerIcon;

  static final CameraPosition _kochi = CameraPosition(
    target: LatLng(33.565220, 133.561518),
    zoom: 17,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();

    rootBundle.loadString("assets/map01.txt").then((json) => _mapstyle = json);
  }
  
  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(33.5654042, 133.5614302),
        icon: _markerIcon,
      ),
    ].toSet();
  }

    Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: Size.square(80));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'images/kaizoku_takarabako2.png')
          .then(_updateBitmap);
    }
  }

    void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return new Scaffold(
      body: GoogleMap(
        //mapType: MapType.hybrid,
        initialCameraPosition: _kochi,
        onMapCreated: (GoogleMapController controller) {
          controller.setMapStyle(_mapstyle);
          _controller.complete(controller);
        },
        cameraTargetBounds: CameraTargetBounds(
          LatLngBounds(
            southwest: LatLng(33.564551, 133.559740),
            northeast: LatLng(33.566452, 133.564639),
          ),
        ),
        zoomGesturesEnabled: false,
        zoomControlsEnabled: false,
        markers: _createMarker(),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

class MapOPage extends StatelessWidget {
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
            onTap: () => Navigator.of(context).pushNamed("/map2"),
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
