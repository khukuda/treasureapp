import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KiyakuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("応募規約"),
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(flex: 7,),
                Center(child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 240.0,
                    ),
                    child: RaisedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/form"),
                      padding: EdgeInsets.only(
                          top: 10, left: 30, right: 30, bottom: 10),
                      shape: StadiumBorder(),
                      color: Colors.lightGreen,
                      child: Text("同意して応募",
                          style: TextStyle(
                              fontSize: 28,
                              color: Color.fromARGB(255, 240, 240, 240))),
                    ))
                ),
                Spacer(flex: 1,),
                                Center(child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 240.0,
                    ),
                    child: RaisedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/form0"),
                      padding: EdgeInsets.only(
                          top: 10, left: 30, right: 30, bottom: 10),
                      shape: StadiumBorder(),
                      color: Colors.lightGreen,
                      child: Text("戻る",
                          style: TextStyle(
                              fontSize: 28,
                              color: Color.fromARGB(255, 240, 240, 240))),
                    ))
                ),
                Spacer(flex: 7,),
              ]),
        )
    );
  }
}