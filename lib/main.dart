import 'package:aphasia/TimeBloc.dart';
import 'package:aphasia/clock.dart';
import 'package:aphasia/play_button.dart';
import 'package:flutter/material.dart';
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
  final TimeBloc timeBloc = TimeBloc();
  TimeContainer currentTime;

  @override
  Widget build(BuildContext context) {
    timeBloc.timeStream.first
        .then((onValue) => setState(() => {this.currentTime = onValue}));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Clock(timeBloc),
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
                      print(DateTime.now());
                      //Code to execute when Floating Action Button is clicked
                      //...
                    },
                  ),
                )
              ],
            ),
            new GestureDetector(child: PlayButton(), onTap: speakOut),
          ],
        ),
      ),
    );
  }

  void speakOut() async {

    this.speakIt(this.currentTime);
  }

  void speakIt(TimeContainer container) async {
    String text = TimeToTextConverter.convertStringToString(
        container.hour, container.minute, container.seconds, lang);
    await flutterTts.setLanguage("de");
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }
}
