import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("ゲーム概要"),
        ),
        body: WebView(
              initialUrl: "https://kochi-goto-omachi.com/treasurewalk/about.html",
              javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}