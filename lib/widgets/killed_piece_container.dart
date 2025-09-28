import 'package:flutter/material.dart';

class KilledPieceContainer extends StatefulWidget {
  final List<Widget> killedPiecesLists;
  const KilledPieceContainer({super.key, required this.killedPiecesLists});

  @override
  State<KilledPieceContainer> createState() => _KilledPieceContainerState();
}

class _KilledPieceContainerState extends State<KilledPieceContainer> {
  @override
  Widget build(BuildContext context) {
    return buildLayout();
  }

  Widget buildLayout() {
    if (widget.killedPiecesLists.length < 8) {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widget.killedPiecesLists
              .take(7)
              .map((item) => Flexible(child: item))
              .toList(),
        ),
      );
    } else {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.killedPiecesLists
                    .take(7)
                    .map((item) => Flexible(child: item))
                    .toList(),
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.killedPiecesLists
                    .skip(8)
                    .map((item) => Flexible(child: item))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
