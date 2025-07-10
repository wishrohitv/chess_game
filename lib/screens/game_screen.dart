import 'package:chess_game/widgets/game_board.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isLarge = (constraints.maxWidth > 600);
          return SafeArea(
            child: responsiveScreen(isLarge, constraints.maxWidth),
          );
        },
      ),
    );
  }

  Widget responsiveScreen(bool isLarge, double width) {
    String bgImg = isLarge
        ? "lib/assets/images/home/empty_bg_big.png"
        : "lib/assets/images/home/empty_bg_small.png";
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImg), fit: BoxFit.fill),
      ),
      child: Center(
        child: Container(
          // constraints: BoxConstraints(
          //   minWidth: 400,
          //   maxWidth: 500,
          //   minHeight: 400 + 120,
          //   maxHeight: 500 + 120,
          // ),
          constraints: BoxConstraints(
            minWidth: 400 + 120,
            maxWidth: 500 + 120,
            minHeight: 400 + 120,
            maxHeight: 500 + 120,
          ),
          width: double.infinity,
          child: GameBoard(),
        ),
      ),
    );
  }
}

