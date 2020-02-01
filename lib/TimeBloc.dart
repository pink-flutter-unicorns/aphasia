import 'dart:async';


class TimeContainer {
  int hours;
  int minutes;
  int seconds;

  TimeContainer(this.hours, this.minutes, this.seconds);


}
class TimeBloc {
  StreamController streamController = StreamController<TimeContainer>.broadcast();

  Sink get timeSink=> streamController.sink;

  Stream<TimeContainer> get timeStream => streamController.stream;


  timeChanged(TimeContainer container) {
    timeSink.add(container);
  }

}