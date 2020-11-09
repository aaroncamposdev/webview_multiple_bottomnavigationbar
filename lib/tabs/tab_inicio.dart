import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TabInicio extends StatefulWidget {
  TabInicio({Key key}) : super(key: key);

  @override
  _TabInicioState createState() => _TabInicioState();
}

WebViewController _controller;

final Completer<WebViewController> _controllerCompleter =
    Completer<WebViewController>();

Future<void> _onWillPop(BuildContext context) async {
  print("onwillpop");
  if (await _controller.canGoBack()) {
    _controller.goBack();
  } else {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('¿Deseas salir de la aplicación?'),
              actions: <Widget>[
                FlatButton(
                  color: Colors.pink[900],
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'),
                ),
                FlatButton(
                  textColor: Colors.pink[900],
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text('Si'),
                ),
              ],
            ));
  }
}

class _TabInicioState extends State<TabInicio>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    UniqueKey();
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: WebView(
          onWebViewCreated: (WebViewController c) {
            _controllerCompleter.future.then((value) => _controller = value);
            _controllerCompleter.complete(c);
          },
          initialUrl: "https://aquicompro.cl/aplicacion-movil/",
          javascriptMode: JavascriptMode.unrestricted),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
