import 'package:aphasia/clock.dart';
import 'package:aphasia/icon_only_button.dart';
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
      title: 'Time2Speech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Time2Speech'),
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
  String textToBeSpoken = "";

  @override
  void initState() {
    super.initState();
    setTimeToNow();
    setText();
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconOnlyButton(
                    image: Image.asset('icons/flags/png/de.png',
                        package: 'country_icons'),
                    pressed: lang == "de",
                    onTap: () {
                      setState(() => lang = "de");
                      setText();
                    }),
                IconOnlyButton(
                    image: Image.asset('icons/flags/png/pl.png',
                        package: 'country_icons'),
                    pressed: lang == "pl",
                    onTap: () {
                      setState(() => lang = "pl");
                      setText();
                    }),
                IconOnlyButton(
                    image: Image.asset('icons/flags/png/us.png',
                        package: 'country_icons'),
                    pressed: lang == "en",
                    onTap: () {
                      setState(() => lang = "en");
                      setText();
                    }),
              ],
            ),
            Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textToBeSpoken,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            new GestureDetector(child: PlayButton(), onTap: speakOut),
          ],
        ),
      ),
    );
  }

  void setText() {
    setState(() {
      this.textToBeSpoken = TimeToTextConverter.convertStringToString(
          hours, minutes, seconds, lang);
    });
  }

  void changeHours(num newHours) {
    setState(() => hours = newHours);
    setText();
  }

  void changeMinutes(num newMinutes) {
    setState(() => minutes = newMinutes);
    setText();
  }

  void changeSeconds(num newSeconds) {
    setState(() => seconds = newSeconds);
    setText();
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
    await flutterTts.setLanguage(lang);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }
}
