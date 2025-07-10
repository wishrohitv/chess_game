import 'package:chess_game/configs.dart';
import 'package:chess_game/utils/piece_move_calculate/piece.dart';

class King implements Piece {
  @override
  int currentPositionIndex;

  @override
  List<int> enemyPiecesIndexList;

  @override
  List<int> userPiecesIndexList;
  King({
    required this.currentPositionIndex,
    required this.userPiecesIndexList,
    required this.enemyPiecesIndexList,
  }) {
    calculateRouteIndexs();
  }

  @override
  String? pieceName;

  @override
  List<int> routeIndexs = [];

  void calculateRouteIndexs() {
    // top
    if (Configs.gridTopCornerIndex.contains(currentPositionIndex)) {
      //
    } else if (userPiecesIndexList.contains(currentPositionIndex - 8)) {
      //
    } else {
      routeIndexs.add(currentPositionIndex - 8);
    }

    // bottom
    if (Configs.gridBottomCornerIndex.contains(currentPositionIndex)) {
      //
    } else if (userPiecesIndexList.contains(currentPositionIndex + 8)) {
      //
    } else {
      routeIndexs.add(currentPositionIndex + 8);
    }

    // left
    if (Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
      //
    } else if (userPiecesIndexList.contains(currentPositionIndex - 1)) {
      //
    } else {
      routeIndexs.add(currentPositionIndex - 1);
    }

    // right
    if (Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
      //
    } else if (userPiecesIndexList.contains(currentPositionIndex + 1)) {
      //
    } else {
      routeIndexs.add(currentPositionIndex + 1);
    }

    // diagonal - top left
    if (Configs.gridTopCornerIndex.contains(currentPositionIndex) ||
        Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
      //
    } else if (userPiecesIndexList.contains(currentPositionIndex - 8 - 1)) {
      //
    } else {
      routeIndexs.add(currentPositionIndex - 8 - 1);
    }

    // diagonal - top right
    if (Configs.gridTopCornerIndex.contains(currentPositionIndex) ||
        Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
      //
    } else if (userPiecesIndexList.contains(currentPositionIndex - 8 + 1)) {
      //
    } else {
      routeIndexs.add(currentPositionIndex - 8 + 1);
    }

    // diagonal - bottom left
    if (Configs.gridBottomCornerIndex.contains(currentPositionIndex) ||
        Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
      //
    } else if (userPiecesIndexList.contains(currentPositionIndex + 8 - 1)) {
      //
    } else {
      routeIndexs.add(currentPositionIndex + 8 - 1);
    }

    // diagonal - bottom right
    if (Configs.gridBottomCornerIndex.contains(currentPositionIndex) ||
        Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
      //
    } else if (userPiecesIndexList.contains(currentPositionIndex + 8 + 1)) {
      //
    } else {
      routeIndexs.add(currentPositionIndex + 8 + 1);
    }
  }
}
