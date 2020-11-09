import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:testapp/tabs/splash_nuevo.dart';
import 'package:your_splash/your_splash.dart';
import 'package:testapp/tabs/home_tabs.dart';
//import 'package:testapp/tabs/nuevo_home.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

Future<void> loadFuture() {
  return Future.delayed(Duration(seconds: 3), () => {print("LOADED!")});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.futured(
        future: loadFuture,
        route: PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeTabs(),
          transitionDuration: Duration(seconds: 2),
          transitionsBuilder: (_, animation, secAnim, child) {
            var tween = Tween(begin: 0.0, end: 1.0).chain(
              CurveTween(curve: Curves.easeInOutBack),
            );
            return FadeTransition(
                opacity: animation.drive(tween), child: child);
          },
        ),
        body: SplashNuevo(),
      ),
    );
  }
}
