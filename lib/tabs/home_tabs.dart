import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url,
        forceWebView: false, enableJavaScript: true, enableDomStorage: true);
  } else {
    throw 'No se pudo abrir el link $url';
  }
}

class HomeTabs extends StatefulWidget {
  int currentTabIndex = 0;

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  List<String> _urls = [
    'https://yoestoyaqui.cl/aplicacion-movil',
    'https://yoestoyaqui.cl/categorias',
    'https://yoestoyaqui.cl/explorar',
    'https://yoestoyaqui.cl/promociones'
  ];

  WebViewController _webController;

  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  Future<void> _onWillPop(BuildContext context) async {
    print("onwillpop");
    if (await _webController.canGoBack()) {
      _webController.goBack();
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

  @override
  Widget build(BuildContext context) {
    print('<----- build init ----->');

    return Scaffold(
      body: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: WebView(
          initialUrl: _urls[widget.currentTabIndex],
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains("tel:")) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            } else if (request.url.contains("whatsapp:")) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            } else if (request.url.contains("mailto:")) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webController) {
            _webController = webController;
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Inicio",
              backgroundColor: Colors.pink[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Categorías",
              backgroundColor: Colors.pink[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Buscar",
              backgroundColor: Colors.pink[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: "Ofertas",
              backgroundColor: Colors.orangeAccent)
        ],
        onTap: (selectedIndex) {
          _webController.loadUrl(_urls[selectedIndex]);

          setState(() {
            widget.currentTabIndex = selectedIndex;
          });
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
