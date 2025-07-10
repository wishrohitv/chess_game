import 'package:chess_game/utils/timer_countdown.dart';
import 'package:flutter/material.dart';

class GameProgress extends StatefulWidget {
  final List<Widget> killedPiece;
  const GameProgress({super.key, required this.killedPiece});

  @override
  State<GameProgress> createState() => _GameProgressState();
}

class _GameProgressState extends State<GameProgress> {
  String timer = "10:00";

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timerCountDown(
      500,
      leftTime: (p0) {
        // print(p0);
        setState(() {
          timer = p0;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        border: BoxBorder.all(width: 0.9, color: Colors.orangeAccent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Killed pieces container
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 70, maxHeight: 70),
            child: Wrap(
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: widget.killedPiece,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.timer_outlined, color: Colors.brown, size: 32),
                Text(
                  timer,
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
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
