import 'package:chess_game/utils/timer_countdown.dart';
import 'package:chess_game/widgets/killed_piece_container.dart';
import 'package:chess_game/widgets/popup_window.dart';
import 'package:flutter/material.dart';

class GameProgress extends StatefulWidget {
  final List<Widget> killedPiecesList;
  final ValueNotifier<Map<String, dynamic>> timeLeftnClockState;
  final Function(int) returnLeftSecond;
  final String opponentPlayer;
  const GameProgress({
    super.key,
    required this.killedPiecesList,
    required this.timeLeftnClockState,
    required this.returnLeftSecond,
    required this.opponentPlayer,
  });

  @override
  State<GameProgress> createState() => _GameProgressState();
}

class _GameProgressState extends State<GameProgress> {
  String timer = "10:00";
  Color bgColor = Colors.brown;
  bool state = false;
  int? secondLeft;

  bool showGaveOverDialog = true;

  final TimerCountdown _timerCountdown = TimerCountdown();

  @override
  void initState() {
    super.initState();
    secondLeft = widget.timeLeftnClockState.value["secondLeft"] as int;
    state = widget.timeLeftnClockState.value["state"] as bool;
    if (state) {
      startTimer(secondLeft!);
      bgColor = Colors.redAccent;
    }
    widget.timeLeftnClockState.addListener(clockState);
  }

  void startTimer(int secondLeft) {
    _timerCountdown.timerCountDown(
      secondLeft,
      leftTime: (countDown, leftSecond) {
        setState(() {
          timer = countDown;
          widget.returnLeftSecond(leftSecond);

          // If the timer reaches zero, and ask player to countinue or close the match then stop the countdown
          if (leftSecond == 0) {
            if (showGaveOverDialog) {
              showResultByTimeup(
                context,
                "${widget.opponentPlayer} won by time up",
              );
              showGaveOverDialog = false;
              closeCountdownTimer();
            }
          }
        });
      },
    );
  }

  void closeCountdownTimer() {
    _timerCountdown.stop();
  }

  void clockState() {
    state = widget.timeLeftnClockState.value["state"];
    if (state) {
      bgColor = Colors.redAccent;
      secondLeft = widget.timeLeftnClockState.value["secondLeft"] as int;
      startTimer(secondLeft!);
    } else {
      bgColor = Colors.brown;
      closeCountdownTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        border: BoxBorder.all(width: 0.9, color: Colors.orangeAccent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Killed pieces container and imgs
          KilledPieceContainer(killedPiecesLists: widget.killedPiecesList),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.timer_outlined, color: Colors.brown, size: 32),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    timer,
                    style: TextStyle(fontSize: 32.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
