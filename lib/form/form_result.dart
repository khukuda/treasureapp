import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FormResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("応募フォーム"),
        ),
        body: WebView(
              initialUrl: "https://kochi-goto-omachi.com/treasurewalk/about.html",
              javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}