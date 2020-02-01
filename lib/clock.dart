import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class Clock extends StatefulWidget {
  final int hours;
  final int minutes;
  final int seconds;

  Clock({int hours, int minutes, int seconds})
      : this.hours = hours,
        this.minutes = minutes,
        this.seconds = seconds;

  @override
  _ClockState createState() => _ClockState(hours, minutes, seconds);
}

class _ClockState extends State<Clock> {
  int hours;
  int minutes;
  int seconds;

  _ClockState(int hours, int minutes, int seconds)
      : this.hours = hours,
        this.minutes = minutes,
        this.seconds = seconds;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new NumberPicker.integer(
            minValue: 0,
            maxValue: 23,
            initialValue: hours,
            onChanged: (newHours) => setState(() => hours = newHours),
            infiniteLoop: true,
          ),
          Text(
            ":",
            style: theme.textTheme.headline.copyWith(color: theme.accentColor),
          ),
          new NumberPicker.integer(
            minValue: 0,
            maxValue: 59,
            initialValue: minutes,
            onChanged: (newMinutes) => setState(() => minutes = newMinutes),
            infiniteLoop: true,
          ),
          Text(
            ":",
            style: theme.textTheme.headline.copyWith(color: theme.accentColor),
          ),
          new NumberPicker.integer(
            minValue: 0,
            maxValue: 59,
            initialValue: seconds,
            onChanged: (newSeconds) => setState(() => seconds = newSeconds),
            infiniteLoop: true,
          ),
        ],
      ),
    );
  }
}
