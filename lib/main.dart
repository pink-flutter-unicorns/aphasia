import 'package:aphasia/clock.dart';
import 'package:aphasia/play_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'TimeToTextConverter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aphasia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Aphasia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts = FlutterTts();
  TimeToTextConverter textConverter = new TimeToTextConverter();
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  String lang = "de";

  @override
  void initState() {
    super.initState();
    setTimeToNow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Clock(
              hours: hours,
              minutes: minutes,
              seconds: seconds,
              onHoursChanged: changeHours,
              onMinutesChanged: changeMinutes,
              onSecondsChanged: changeSeconds,
            ),
            new Row(
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
                      setState(() => setTimeToNow());
                    },
                  ),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('icons/flags/png/de.png',
                      package: 'country_icons'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('icons/flags/png/pl.png',
                      package: 'country_icons'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('icons/flags/png/us.png',
                      package: 'country_icons'),
                ),
              ],
            ),
            new GestureDetector(child: PlayButton(), onTap: speakOut),
          ],
        ),
      ),
    );
  }

  void changeHours(num newHours) {
    setState(() => hours = newHours);
  }

  void changeMinutes(num newMinutes) {
    setState(() => minutes = newMinutes);
  }

  void changeSeconds(num newSeconds) {
    setState(() => seconds = newSeconds);
  }

  void setTimeToNow() {
    var time = DateTime.now();
    hours = time.hour;
    minutes = time.minute;
    seconds = time.second;
  }

  void speakOut() async {
    String text = TimeToTextConverter.convertStringToString(
        hours, minutes, seconds, lang);
    await flutterTts.setLanguage("de");
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }
}
