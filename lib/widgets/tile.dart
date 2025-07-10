import 'package:chess_game/widgets/empty_container.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Color color;
  final String? title;
  final Widget? pieces;
  final int index;
  final void Function(int)? returnIndex;
  const Tile({
    super.key,
    required this.color,
    this.title,
    this.pieces,
    required this.index,
    this.returnIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Stack(
        children: [
          Text(
            title ?? "",
            style: TextStyle(
              backgroundColor: Color.fromARGB(150, 255, 255, 255),
            ),
          ),
          pieces ??
              EmptyContainer(
                index: index,
                emptyTileCallback: (p0) {
                  if (returnIndex != null) {
                    returnIndex!(p0);
                  }
                  print("Callback HIT at index: $p0");
                },
              ),
        ],
      ),
    );
  }
}
