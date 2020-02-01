import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class Clock extends StatelessWidget {
  final int hours;
  final int minutes;
  final int seconds;
  final ValueChanged<num> onHoursChanged;
  final ValueChanged<num> onMinutesChanged;
  final ValueChanged<num> onSecondsChanged;

  Clock(
      {this.hours,
      this.minutes,
      this.seconds,
      this.onHoursChanged,
      this.onMinutesChanged,
      this.onSecondsChanged});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var hoursPicker = NumberPicker.integer(
      minValue: 0,
      maxValue: 23,
      initialValue: hours,
      onChanged: onHoursChanged,
      infiniteLoop: true,
    );
    var minutesPicker = NumberPicker.integer(
      minValue: 0,
      maxValue: 59,
      initialValue: minutes,
      onChanged: onMinutesChanged,
      infiniteLoop: true,
    );
    var secondsPicker = NumberPicker.integer(
      minValue: 0,
      maxValue: 59,
      initialValue: seconds,
      onChanged: onSecondsChanged,
      infiniteLoop: true,
    );

    Future.delayed(Duration(milliseconds: 100), () {
      try {
        hoursPicker.animateInt(hours);
        minutesPicker.animateInt(minutes);
        secondsPicker.animateInt(seconds);
      } catch (e) {
        print(
            "Silently catching exception from picker ${e.toString()}"); // ScrollController not attached to any scroll views
      }
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              hoursPicker,
              Text(
                ":",
                style: theme.textTheme.headline.copyWith(color: theme.accentColor),
              ),
              minutesPicker,
              Text(
                ":",
                style: theme.textTheme.headline.copyWith(color: theme.accentColor),
              ),
              secondsPicker,
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton.icon(
                  color: Colors.blue,
                  icon: Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                  label: Text('Now',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: () {
                    var time = DateTime.now();
                    onHoursChanged(time.hour);
                    onMinutesChanged(time.minute);
                    onSecondsChanged(time.second);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
