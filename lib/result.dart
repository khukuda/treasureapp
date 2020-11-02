import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          constraints: BoxConstraints.expand(),
          child: Image.asset("images/result.png",
        fit: BoxFit.fill,
        ),),
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(
                  flex: 5,
                ),
                Center(
                  child: Image.asset(
                    "images/coin.png",
                    fit: BoxFit.cover,
                    width: size.width * 0.8,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Image.asset(
                  "images/treasurebox_open.png",
                  fit: BoxFit.cover,
                  width: size.width * 0.5,
                ),
                Spacer(
                  flex: 2,
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 240.0,
                    ),
                    child: RaisedButton(
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed("/menu"),
                      padding: EdgeInsets.only(
                          top: 10, left: 30, right: 30, bottom: 10),
                      shape: StadiumBorder(),
                      color: Colors.lightGreen,
                      child: Text("戻る",
                          style: TextStyle(
                              fontSize: 28,
                              color: Color.fromARGB(255, 240, 240, 240))),
                    )),
                Spacer(
                  flex: 2,
                ),
              ]),
        )
      ]),
    );
  }
}
