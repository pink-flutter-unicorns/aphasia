import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayButton extends StatelessWidget {
  final double radius = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(radius),
        color: Colors.blue,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.volume_up,
                size: 30,
                color: Colors.white,
              ),
              Text(
                "Speak",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
