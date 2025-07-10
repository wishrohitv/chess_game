import 'package:flutter/material.dart';

class BlackSoldierPieces extends StatelessWidget {
  const BlackSoldierPieces({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage("lib/assets/images/pieces/black/soldier.png"),
      ),
    );
  }
}

class WhiteSoldierPieces extends StatelessWidget {
  const WhiteSoldierPieces({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage("lib/assets/images/pieces/white/soldier.png"),
      ),
    );
  }
}

class Pieces extends StatelessWidget {
  final String pieceImage;
  final String pieceName;
  const Pieces({super.key, required this.pieceImage, required this.pieceName});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image(image: AssetImage(pieceImage)));
  }
}
