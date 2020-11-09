import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class WebViewScreen extends StatefulWidget {
  @override
  _StateWebViewScreen createState() => _StateWebViewScreen();
}

class _StateWebViewScreen extends State<WebViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Platform.isMacOS || Platform.isWindows || Platform.isFuchsia
          ? Center(
              child: Text('This platform is not support for webview'),
            )
          : WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
                  "https://aquicompro.cl/explorar/?type=promociones&sort=top-rated",
              onWebViewCreated: (WebViewController controller) {
              },
            ),
    );
  }
}
