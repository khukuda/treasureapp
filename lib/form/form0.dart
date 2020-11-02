import 'package:flutter/material.dart';

class FormStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Center(
                child: Text("あなたはいま",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                    ))),
            Spacer(
              flex: 1,
            ),
            Image.asset(
              "images/coin.png",
              fit: BoxFit.cover,
            ),
            Spacer(
              flex: 1,
            ),
            Center(
              child: Text(
                "5 枚のコインを\n持っています",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 240.0,
                ),
                child: RaisedButton(
                  onPressed: () => Navigator.of(context).pushNamed("/kiyaku"),
                  padding:
                      EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                  shape: StadiumBorder(),
                  color: Colors.lightGreen,
                  child: Text("応募する",
                      style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 240, 240, 240))),
                )),
            Spacer(
              flex: 1,
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 240.0,
                ),
                child: RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  padding:
                      EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                  shape: StadiumBorder(),
                  color: Colors.lightGreen,
                  child: Text("戻る",
                      style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 240, 240, 240))),
                )),
            Spacer(
              flex: 1,
            ),
          ]),
    ));
  }
}
