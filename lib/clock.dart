import 'package:aphasia/TimeBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class Clock extends StatefulWidget {
  final TimeBloc timeBloc;

  Clock(this.timeBloc);

  @override
  _ClockState createState() => _ClockState(timeBloc);
}

class _ClockState extends State<Clock> {
  TimeBloc timeBloc;

  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  _ClockState(this.timeBloc);

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
            onChanged: (newHours) => {
                  setState(() => {this.hours = newHours, this.setValue()})
                },
            infiniteLoop: true,
          ),
          Text(
            ":",
            style: theme.textTheme.headline.copyWith(color: theme.accentColor),
          ),
          new NumberPicker.integer(
            minValue: 0,
            maxValue: 59,
            initialValue: 0,
            onChanged: (newMinutes) => {
              setState(() => {this.minutes = newMinutes, this.setValue()})
            },
            infiniteLoop: true,
          ),
          Text(
            ":",
            style: theme.textTheme.headline.copyWith(color: theme.accentColor),
          ),
          new NumberPicker.integer(
            minValue: 0,
            maxValue: 59,
            initialValue: 0,
            onChanged: (newSeconds) => {
              setState(() => {this.seconds = newSeconds, this.setValue()})
            },
            infiniteLoop: true,
          ),
        ],
      ),
    );
  }

  void setValue() {
    this
        .timeBloc
        .timeSink
        .add(new TimeContainer(this.hours, this.minutes, this.seconds));
  }
}
