import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TabOfertas extends StatefulWidget {
  TabOfertas({Key key}) : super(key: key);

  @override
  _TabOfertasState createState() => _TabOfertasState();
}

class _TabOfertasState extends State<TabOfertas>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WebView(
        initialUrl:
            "https://aquicompro.cl/explorar/?type=promociones&sort=top-rated",
        javascriptMode: JavascriptMode.unrestricted);
  }

  @override
  bool get wantKeepAlive => true;
}
