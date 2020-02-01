import 'dart:async';


class TimeContainer {
  int hour;
  int minute;
  int seconds;

  TimeContainer(this.hour, this.minute, this.seconds);


}
class TimeBloc {

  StreamController streamController = StreamController<TimeContainer>.broadcast();

  Sink get timeSink=> streamController.sink;

  Stream<TimeContainer> get timeStream => streamController.stream;


  timeChanged(TimeContainer container) {
    timeSink.add(container);
  }

}