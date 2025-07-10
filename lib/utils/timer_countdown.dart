import 'dart:async';

void timerCountDown(int seconds, {Function(String)? leftTime}) {
  Timer.periodic(Duration(seconds: 1), (timer) {
    leftTime!(secondToMinute(seconds-timer.tick));
  });
}

String secondToMinute(int seconds) {
  double second_ = seconds / 60; // devide to convert into minute
  return second_.toStringAsFixed(2);
}
