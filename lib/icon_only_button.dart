import 'package:flutter/material.dart';

class IconOnlyButton extends StatelessWidget {
  final Image image;
  final bool pressed;
  final Function onTap;

  IconOnlyButton({this.image, this.pressed, this.onTap});

  @override
  Widget build(BuildContext context) {
    var button = Padding(
      padding: const EdgeInsets.all(8.0),
      child: image,
    );

    return GestureDetector(
        child: pressed ? Container(color: Colors.blue, child: button) : button,
        onTap: onTap);
  }
}
