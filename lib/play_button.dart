import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(40.0),
        color: Colors.blue,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Icon(Icons.volume_up, size: 30,),
          Text(
            "Speak",
            style: TextStyle(fontSize: 20),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
