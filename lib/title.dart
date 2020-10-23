import 'package:flutter/material.dart';
import 'package:treasureapp/menu.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            child: Image.asset(
              "images/splash.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Spacer(
                flex: 7,
              ),
              Center(
                child: Text(
                  "タップしてスタート",
                  style: new TextStyle(
                      color: Colors.white,
                      fontFamily: "Tetu",
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 6.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ]),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ],
      ),
      //onTap: () => Navigator.push(context, _FadeAnimationCustomRoute(builder: (BuildContext context) => MenuPage())),
      onTap: () => Navigator.of(context).pushReplacementNamed("/menu"),
    ));
  }
}

class _FadeAnimationCustomRoute<T> extends MaterialPageRoute<T> {
  _FadeAnimationCustomRoute(
      {WidgetBuilder builder,
      RouteSettings settings,
      bool fullscreenDialog = false})
      : super(
            builder: builder,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
