import 'package:flutter/material.dart';
import 'package:chess_game/screens/home_screen.dart';

void main() {
  runApp(ChessGame());
}

class ChessGame extends StatelessWidget {
  const ChessGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
