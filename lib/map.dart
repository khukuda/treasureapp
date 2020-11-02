import "dart:ui";

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPage extends StatelessWidget {
  double _ratio = 0;
  BuildContext _context;

  Widget NameImage({
    double top,
    double left,
    String assetName,
    double size = 16.0,
    double opacity = 1.0,
  }) {
    return Positioned(
      top: top * _ratio,
      left: left * _ratio,
      child: GestureDetector(
        child: SvgPicture.asset(
          assetName,
          height: size * _ratio,
          color: Color.fromRGBO(150, 80, 60, opacity),
        ),
        onTap: () => Navigator.of(_context).pushNamed("/map_g"),
      ),
    );
  }

  Widget MaruImage(
      {double top,
      double left,
      BuildContext context = null,
      double opacity = 1.0}) {
    SvgPicture maru_image = SvgPicture.asset(
      "images/map/maru.svg",
      color: Color.fromRGBO(104, 66, 75, opacity),
      height: 22 * _ratio,
    );
    return Positioned(
        top: top * _ratio, left: left * _ratio, child: maru_image);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    final Size size = MediaQuery.of(context).size;
    _ratio = size.width / 453;
    Image map_image = Image.asset("images/map/map_bk.png");

    double scale_size = 800 / 453;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 90, 70, 10),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: OrientationBuilder(builder: (context, orientation) {
        _ratio =
            (orientation == Orientation.portrait ? size.width : size.height) /
                453;
        SvgPicture coin_image = SvgPicture.asset(
          "images/map/coin-txt.svg",
          height: 22 * _ratio,
        );

        Image t1020_image = Image.asset(
          "images/map/1020.png",
          height: 62 * _ratio,
        );
        SvgPicture batsu_image = SvgPicture.asset(
          "images/map/batsu.svg",
          height: 24 * _ratio,
        );
        return Center(
          child: RotatedBox(
            quarterTurns: (orientation == Orientation.portrait ? 1 : 0),
            child: Stack(children: [
              map_image,
              // 万々
              MaruImage(top: 141, left: 297),
              NameImage(top: 144, left: 323, assetName: "images/map/mama.svg"),
              // 愛宕
              MaruImage(top: 153, left: 360),
              NameImage(top: 153, left: 390, assetName: "images/map/atago.svg"),
              // 卸団地
              MaruImage(top: 160, left: 628),
              NameImage(
                  top: 162,
                  left: 654,
                  assetName: "images/map/oroshidanchi.svg"),

              // 旭
              MaruImage(top: 292, left: 107),
              NameImage(top: 272, left: 105, assetName: "images/map/asahi.svg"),
              // 升形
              MaruImage(top: 266, left: 197),
              NameImage(
                  top: 264, left: 157, assetName: "images/map/masugata.svg"),

              // 帯屋町1
              MaruImage(top: 221, left: 377),
              NameImage(
                  top: 201, left: 343, assetName: "images/map/obiyamachi1.svg"),
              // 帯屋町2
              MaruImage(top: 222, left: 339),
              NameImage(
                  top: 224, left: 269, assetName: "images/map/obiyamachi2.svg"),
              // 壱番街
              MaruImage(top: 235, left: 415),
              NameImage(
                  top: 217, left: 406, assetName: "images/map/ichibangai.svg"),
              // おびさんロード
              MaruImage(top: 248, left: 357),
              NameImage(
                  top: 248, left: 232, assetName: "images/map/obisan-road.svg"),
              // 京町・新京橋
              MaruImage(top: 251, left: 385),
              NameImage(
                  top: 272,
                  left: 379,
                  assetName: "images/map/kyobashi.svg",
                  size: 34),
              // 大橋通り
              Positioned(
                  top: 285 * _ratio, left: 273 * _ratio, child: batsu_image),
              MaruImage(top: 285, left: 313, opacity: 0.3),
              NameImage(
                  top: 289,
                  left: 245,
                  assetName: "images/map/ohashidori.svg",
                  opacity: 0.3),

              // はりまや橋
              MaruImage(top: 261, left: 452),
              NameImage(
                  top: 261,
                  left: 475,
                  assetName: "images/map/harimayabashi.svg"),
              // さえんば
              MaruImage(top: 291, left: 540),
              NameImage(
                  top: 291, left: 566, assetName: "images/map/saenba.svg"),

              // 天神橋
              MaruImage(top: 324, left: 312),
              NameImage(
                  top: 347, left: 291, assetName: "images/map/tenjinbashi.svg"),

              Positioned(
                  bottom: 65 * _ratio, right: 16 * _ratio, child: t1020_image),
              Positioned(
                  bottom: 34 * _ratio, right: 16 * _ratio, child: coin_image),
              Positioned(
                //top: 0,
                bottom: 20 * _ratio,
                left: 20 * _ratio,
                child: FloatingActionButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              )
            ]),
          ),
        );
      }),
      /*
      body: Transform.rotate(
        angle: pi/2,
        child: Container(
          width: size.height,
          color:  Color.fromARGB(255, 0, 0, 0),
          constraints: BoxConstraints.expand(),
          child: Stack(children: [
          GestureDetector(
            child: Container(
              width: size.height,
              color: Color.fromARGB(266, 100, 100, 200),
              constraints: BoxConstraints.expand(),
              child: Transform.scale(
                //scale: size.height / size.width,
                scale: scale_size,
                child: map),
            ),
            onTap: () => Navigator.of(context).pushNamed("/map_g"),
          ),
          Positioned(
              top: 20,
              left: 70,
              child: Transform.rotate(
                  angle: pi/2,
                  child: FloatingActionButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: () => {Navigator.of(context).pop()},
                  )))
        ]),),
      ),*/
    );
  }
}
