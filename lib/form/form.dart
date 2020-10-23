import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            TextField(
                enabled: true,
                // 入力数
                //maxLength: 10,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.red),
                obscureText: false,
                maxLines: 1,
                onChanged: (value) => {},
                decoration: const InputDecoration(
                  hintText: 'お名前を入力してください',
                  labelText: 'お名前 *',
                )),
            Spacer(
              flex: 1,
            ),
            TextField(
                enabled: true,
                // 入力数
                //maxLength: 10,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.red),
                obscureText: false,
                maxLines: 1,
                onChanged: (value) => {},
                decoration: const InputDecoration(
                  hintText: '生年月日を入力してください',
                  labelText: '生年月日 *',
                )),
            Spacer(
              flex: 1,
            ),
            TextField(
                enabled: true,
                // 入力数
                //maxLength: 10,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.red),
                obscureText: false,
                maxLines: 1,
                onChanged: (value) => {},
                decoration: const InputDecoration(
                  hintText: '住所を入力してください',
                  labelText: '住所 *',
                )),
            Spacer(
              flex: 3,
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 240.0,
                ),
                child: RaisedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/form_result"),
                  padding:
                      EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                  shape: StadiumBorder(),
                  color: Colors.lightGreen,
                  child: Text("応募",
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
                  child: Text("やめる",
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
