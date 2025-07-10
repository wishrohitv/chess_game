import 'dart:async';

void timerCountDown(int seconds_, {Function(String)? leftTime}) {
  var (minute as int, second as int) = getMinuteAndSecond(seconds_);
  Timer.periodic(Duration(seconds: 1), (timer) {
    if (second == 0) {
      minute -= 1;
      second = 60;
    } else {
      second -= 1;
    }
    leftTime?.call(formateMinuteAndsecond(minute, second));
  });
}

String formateMinuteAndsecond(int minute, int second) {
  return "${minute.toString().length < 2 ? '0$minute' : minute}:${second.toString().length < 2 ? '0$second' : second}";
}

(int minute, int second) getMinuteAndSecond(int seconds_) {
  int minute = seconds_ ~/ 60;
  int second = seconds_ % 60;

  return (minute, second);
}
