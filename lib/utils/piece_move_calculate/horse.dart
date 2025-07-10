import 'package:chess_game/configs.dart';
import 'package:chess_game/utils/piece_move_calculate/piece.dart';

class Horse implements Piece {
  @override
  int currentPositionIndex;

  @override
  List<int> enemyPiecesIndexList;

  @override
  List<int> userPiecesIndexList;
  Horse({
    required this.currentPositionIndex,
    required this.userPiecesIndexList,
    required this.enemyPiecesIndexList,
  }) {
    calculateRouteIndexY();
    calculateRouteIndexX();
  }

  @override
  String? pieceName;

  @override
  List<int> routeIndexs = [];

  void calculateRouteIndexY() {
    /// Up
    if (Configs.gridRightCornerIndex.contains((currentPositionIndex - 8 - 8))) {
      // don't sum with 1
    } else {
      if (userPiecesIndexList.contains(currentPositionIndex - 8 - 8 + 1)) {
        // don't add
      } else {
        routeIndexs.add(currentPositionIndex - 8 - 8 + 1); // right
      }
    }

    if (Configs.gridLeftCornerIndex.contains((currentPositionIndex - 8 - 8))) {
      // don't subtract with 1
    } else {
      if (userPiecesIndexList.contains(currentPositionIndex - 8 - 8 - 1)) {
        // don't add
      } else {
        if (userPiecesIndexList.contains(currentPositionIndex - 8 - 8 - 1)) {
          // don't add
        } else {
          routeIndexs.add(currentPositionIndex - 8 - 8 - 1); // left
        }
      }
    }

    /// Down
    if (Configs.gridRightCornerIndex.contains((currentPositionIndex + 8 + 8))) {
      // don't sum with 1
    } else {
      if (userPiecesIndexList.contains(currentPositionIndex + 8 + 8 + 1)) {
        // don't add
      } else {
        routeIndexs.add(currentPositionIndex + 8 + 8 + 1); // right
      }
    }

    if (Configs.gridLeftCornerIndex.contains((currentPositionIndex + 8 + 8))) {
      // don't subtract with 1
    } else {
      if (userPiecesIndexList.contains(currentPositionIndex + 8 + 8 - 1)) {
        // don't add
      } else {
        routeIndexs.add(currentPositionIndex + 8 + 8 - 1); // left
      }
    }
  }

  void calculateRouteIndexX() {
    // Right
    if (Configs.gridRightCornerIndex.contains(currentPositionIndex + 1) ||
        Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
      // if we assuming piece position is one tile away from Configs.gridRightCornerIndex and
      // or piece is on Configs.gridRightCornerIndex then route will not valid
    } else {
      if (userPiecesIndexList.contains(currentPositionIndex + 2 + 8) == false) {
        routeIndexs.add(currentPositionIndex + 2 + 8); // down
      }
      if (userPiecesIndexList.contains(currentPositionIndex + 2 - 8) == false) {
        routeIndexs.add(currentPositionIndex + 2 - 8); // up
      }
    }

    // Left
    if (Configs.gridLeftCornerIndex.contains(currentPositionIndex - 1) ||
        Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
      // if we assuming piece position is one tile away from Configs.gridLeftCornerIndex and
      // or piece is on Configs.gridLeftCornerIndex then route will not valid
    } else {
      if (userPiecesIndexList.contains(currentPositionIndex - 2 + 8) == false) {
        routeIndexs.add(currentPositionIndex - 2 + 8); // down
      }
      if (userPiecesIndexList.contains(currentPositionIndex - 2 - 8) == false) {
        routeIndexs.add(currentPositionIndex - 2 - 8); // up
      }
    }
  }
}
