import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TabCategorias extends StatefulWidget {
  TabCategorias({Key key}) : super(key: key);

  @override
  _TabCategoriasState createState() => _TabCategoriasState();
}

class _TabCategoriasState extends State<TabCategorias>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    UniqueKey();
    return WebView(
        initialUrl: "https://aquicompro.cl/categorias/",
        javascriptMode: JavascriptMode.unrestricted);
  }

  @override
  bool get wantKeepAlive => true;
}
