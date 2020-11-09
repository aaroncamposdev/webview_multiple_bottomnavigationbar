import 'package:flutter/material.dart';

class AquiComproSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(decoration: BoxDecoration(color: Colors.pink[900])),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Todo lo que necesitas en un solo lugar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal)),
                  ],
                ))
          ],
        )
      ],
    ));
  }
}
