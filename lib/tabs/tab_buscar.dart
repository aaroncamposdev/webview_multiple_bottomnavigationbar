import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TabBuscar extends StatefulWidget {
  TabBuscar({Key key}) : super(key: key);

  @override
  _TabBuscarState createState() => _TabBuscarState();
}

class _TabBuscarState extends State<TabBuscar>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WebView(
        initialUrl: "https://aquicompro.cl/explorar/",
        javascriptMode: JavascriptMode.unrestricted);
  }

  @override
  bool get wantKeepAlive => true;
}
