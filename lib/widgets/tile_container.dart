import 'package:chess_game/settings.dart';
import 'package:flutter/material.dart';

class TileContainer extends StatefulWidget {
  final Color color;
  final String? title;
  final Widget? pieces;
  final String? piecesName;
  final int index;
  final void Function(int)? returnIndex;
  final void Function(int index, String pieceName, bool validRoutePosition)?
  emptyTileCallback;
  final ValueNotifier<Map<String, dynamic>>? showMoveRoutes;
  const TileContainer({
    super.key,
    required this.color,
    this.title,
    this.pieces,
    required this.index,
    this.returnIndex,
    this.emptyTileCallback,
    this.showMoveRoutes,
    this.piecesName,
  });

  @override
  State<TileContainer> createState() => _TileContainerState();
}

class _TileContainerState extends State<TileContainer> {
  bool showMoves = false;

  @override
  void initState() {
    super.initState();
    widget.showMoveRoutes?.addListener(drawMoves);
  }

  void drawMoves() {
    // Check if nextRoute length is empty then disable route highlight
    if (widget.showMoveRoutes!.value['nextRoute'].length == 0) {
      // showMoves = widget.showMoveRoutes!.value['isShow'];
      showMoves = false;
      setState(() {});
    } else {
      // Check if nextRoute length is not empty then enable route highlight
      for (var nxtIndex in widget.showMoveRoutes!.value['nextRoute']) {
        if (widget.index == nxtIndex) {
          showMoves = widget.showMoveRoutes!.value['isShow'];
          setState(() {});
        }
      }
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.showMoveRoutes?.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.emptyTileCallback != null) {
          print("${widget.index} $showMoves ${widget.piecesName}");
          widget.emptyTileCallback!(
            widget.index,
            widget.piecesName ?? "null",
            showMoves ? true : false,
          );
        }
        // print("Callback exists? ${emptyTileCallback != null}");
        // print("Callback runtimeType: ${emptyTileCallback.runtimeType}");
        // print(index);
      },

      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: widget.color,
          // Recently moved piece highlight
          // border:
          //     showMoves //
          //     ? BoxBorder.all(
          //         width: 2.8,
          //         color: const Color.fromARGB(255, 244, 2, 244),
          //       )
          //     : BoxBorder.all(width: 1, color: Colors.transparent),
        ),
        child: Stack(
          children: [
            developmentMode
                ? Text(
                    widget.title ?? "",
                    style: TextStyle(
                      backgroundColor: Color.fromARGB(96, 255, 255, 255),
                    ),
                  )
                : Container(),
            widget.pieces ?? Container(),

            // Valid route highlight
            showMoves
                ? // aka valid route
                  Center(
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(116, 217, 5, 255),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
