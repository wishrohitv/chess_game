import 'package:chess_game/configs.dart';
import 'package:chess_game/widgets/c_button.dart';
import 'package:chess_game/widgets/chess_pieces.dart';
import 'package:flutter/material.dart';

Future<void> showResult(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            Flexible(child: CButton(text: "Play again", onTap: (){},)),
          ],
        ),
      );
    },
  );
}

Future<void> pickNewPieceDialog(
  BuildContext context,
  String player, {
  required Function(String) choosedNewPieceName,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return ChooseNewPiece(
        user: player,
        choosedPieceName: (p0) {
          choosedNewPieceName(p0);
        },
      );
    },
  );
}

class ChooseNewPiece extends StatefulWidget {
  final String user;
  final Function(String) choosedPieceName;
  const ChooseNewPiece({
    super.key,
    required this.user,
    required this.choosedPieceName,
  });
  @override
  State<ChooseNewPiece> createState() => _ChooseNewPieceState();
}

enum AvailablePiece { elephant, horse, chariot, minister }

class _ChooseNewPieceState extends State<ChooseNewPiece> {
  AvailablePiece availablePiece = AvailablePiece.elephant;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Choose any of them"),

          SegmentedButton<AvailablePiece>(
            segments: <ButtonSegment<AvailablePiece>>[
              ButtonSegment<AvailablePiece>(
                value: AvailablePiece.elephant,
                label: Pieces(
                  pieceImage: Configs.piecesWithPath["${widget.user}Elephant"]!,
                  pieceName: "${widget.user}Soldier",
                ),
                icon: Icon(Icons.wrong_location),
              ),
              ButtonSegment<AvailablePiece>(
                value: AvailablePiece.horse,
                label: Pieces(
                  pieceImage: Configs.piecesWithPath["${widget.user}Horse"]!,
                  pieceName: "${widget.user}Horse",
                ),
                icon: Icon(Icons.wrong_location),
              ),
              ButtonSegment<AvailablePiece>(
                value: AvailablePiece.chariot,
                label: Pieces(
                  pieceImage: Configs.piecesWithPath["${widget.user}Chariot"]!,
                  pieceName: "${widget.user}Chariot",
                ),
                icon: Icon(Icons.wrong_location),
              ),
              ButtonSegment<AvailablePiece>(
                value: AvailablePiece.minister,
                label: Pieces(
                  pieceImage: Configs.piecesWithPath["${widget.user}Minister"]!,
                  pieceName: "${widget.user}Minister",
                ),
                icon: Icon(Icons.wrong_location),
              ),
            ],
            selected: <AvailablePiece>{availablePiece},
            onSelectionChanged: (Set<AvailablePiece> newSelection) {
              setState(() {
                // By default there is only a single segment that can be
                // selected at one time, so its value is always the first
                // item in the selected set.
                availablePiece = newSelection.first;
              });
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              CButton(
                text: "Close",
                onTap: () {
                  // Call back and close the popup
                  widget.choosedPieceName(
                    "${widget.user}${availablePiece.name.substring(0, 1).toUpperCase()}${availablePiece.name.substring(1)}",
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
