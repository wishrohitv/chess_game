import 'package:chess_game/configs.dart';
import 'package:chess_game/utils/piece_move_calculate/piece.dart';

class Soldier implements Piece {
  @override
  int currentPositionIndex;

  @override
  List<int> enemyPiecesIndexList;

  @override
  List<int> userPiecesIndexList;
  Soldier({
    required this.currentPositionIndex,
    this.pieceName,
    required this.userPiecesIndexList,
    required this.enemyPiecesIndexList,
  }) {
    calculateWhiteSoldierRoute();
    calculateBlackSoldierRoute();
  }

  @override
  String? pieceName;

  List<int> topSoldierIntialIndex = [8, 9, 10, 11, 12, 13, 14, 15];

  List<int> bottomSoldierIntialIndex = [48, 49, 50, 51, 52, 53, 54, 55];

  Map<String, String> soldier = {
    "blackSoldier": "black",
    "whiteSoldier": "white",
  };

  @override
  List<int> routeIndexs = [];

  // Calculating routes for white soldier
  void calculateWhiteSoldierRoute() {
    // Goes up
    List<int> childRouteIndexs = [];
    if (Configs.gridTopCornerIndex.contains(currentPositionIndex) &&
        soldier[pieceName] == "white") {
      //
    } else if (soldier[pieceName] == "white") {
      if (userPiecesIndexList.contains(currentPositionIndex - 8) ||
          enemyPiecesIndexList.contains(currentPositionIndex - 8)) {
        // If any piece above already exists then
        // dont add

        // check for diagonal top - left
        if (Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
          // If piece already exists on left corner then dont add
          //
        } else {
          if (userPiecesIndexList.contains(currentPositionIndex - 8 - 1)) {
            // If this place friend pieces already exists then dont add
            //
          } else if (enemyPiecesIndexList.contains(
            currentPositionIndex - 8 - 1,
          )) {
            // If ths place enemy piece exists then add
            childRouteIndexs.add(currentPositionIndex - 8 - 1);
          }
        }

        // check for diagonal top - right
        if (Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
          // If piece already exists on left corner then dont add
          //
        } else {
          if (userPiecesIndexList.contains(currentPositionIndex - 8 + 1)) {
            // If this place friend pieces already exists then dont add
            //
          } else if (enemyPiecesIndexList.contains(
            currentPositionIndex - 8 + 1,
          )) {
            childRouteIndexs.add(currentPositionIndex - 8 + 1);
          }
        }
      } else {
        // If any piece above exists then
        // add
        childRouteIndexs.add(currentPositionIndex - 8);

        // check for diagonal top - left
        if (Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
          // If piece already exists on left corner then dont add
          //
        } else {
          if (userPiecesIndexList.contains(currentPositionIndex - 8 - 1)) {
            // If this place friend pieces already exists then dont add
            //
          } else if (enemyPiecesIndexList.contains(
            currentPositionIndex - 8 - 1,
          )) {
            // If ths place enemy piece exists then add
            childRouteIndexs.add(currentPositionIndex - 8 - 1);
          }
        }

        // check for diagonal top - right
        if (Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
          // If piece already exists on left corner then dont add
          //
        } else {
          if (userPiecesIndexList.contains(currentPositionIndex - 8 + 1)) {
            // If this place friend pieces already exists then dont add
            //
          } else if (enemyPiecesIndexList.contains(
            currentPositionIndex - 8 + 1,
          )) {
            childRouteIndexs.add(currentPositionIndex - 8 + 1);
          }
        }

        // check for if piece is its initial position

        if (bottomSoldierIntialIndex.contains(currentPositionIndex)) {
          if (userPiecesIndexList.contains(currentPositionIndex - 8 - 8) ||
              enemyPiecesIndexList.contains(currentPositionIndex - 8 - 8)) {
            // don't add
          } else {
            // add top route
            childRouteIndexs.add(currentPositionIndex - 8 - 8);
          }
        }
      }
    }

    for (int indx in childRouteIndexs) {
      routeIndexs.add(indx);
    }
  }

  // Calculating routes for black soldier
  void calculateBlackSoldierRoute() {
    // Goes up
    List<int> childRouteIndexs = [];
    if (Configs.gridBottomCornerIndex.contains(currentPositionIndex) &&
        soldier[pieceName] == "black") {
      //
    } else if (soldier[pieceName] == "black") {
      if (userPiecesIndexList.contains(currentPositionIndex + 8) ||
          enemyPiecesIndexList.contains(currentPositionIndex + 8)) {
        // If any piece above already exists then
        // dont add

        // check for diagonal bottom - left
        if (Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
          // If piece already exists on left corner then dont add
          //
        } else {
          if (userPiecesIndexList.contains(currentPositionIndex + 8 - 1)) {
            // If this place friend pieces already exists then dont add
            //
          } else if (enemyPiecesIndexList.contains(
            currentPositionIndex + 8 - 1,
          )) {
            // If ths place enemy piece exists then add
            childRouteIndexs.add(currentPositionIndex + 8 - 1);
          }
        }

        // check for diagonal bottom - right
        if (Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
          // If piece already exists on left corner then dont add
          //
        } else {
          if (userPiecesIndexList.contains(currentPositionIndex + 8 + 1)) {
            // If this place friend pieces already exists then dont add
            //
          } else if (enemyPiecesIndexList.contains(
            currentPositionIndex + 8 + 1,
          )) {
            childRouteIndexs.add(currentPositionIndex + 8 + 1);
          }
        }
      } else {
        // If any piece above exists then
        // add
        childRouteIndexs.add(currentPositionIndex + 8);

        // check for diagonal bottom - left
        if (Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
          // If piece already exists on left corner then dont add
          //
        } else {
          if (userPiecesIndexList.contains(currentPositionIndex + 8 - 1)) {
            // If this place friend pieces already exists then dont add
            //
          } else if (enemyPiecesIndexList.contains(
            currentPositionIndex + 8 - 1,
          )) {
            // If ths place enemy piece exists then add
            childRouteIndexs.add(currentPositionIndex + 8 - 1);
          }
        }

        // check for diagonal bottom - right
        if (Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
          // If piece already exists on left corner then dont add
          //
        } else {
          if (userPiecesIndexList.contains(currentPositionIndex + 8 + 1)) {
            // If this place friend pieces already exists then dont add
            //
          } else if (enemyPiecesIndexList.contains(
            currentPositionIndex + 8 + 1,
          )) {
            childRouteIndexs.add(currentPositionIndex + 8 + 1);
          }
        }

        // check for if piece is its initial position

        if (topSoldierIntialIndex.contains(currentPositionIndex)) {
          if (userPiecesIndexList.contains(currentPositionIndex + 8 + 8) ||
              enemyPiecesIndexList.contains(currentPositionIndex + 8 + 8)) {
            // don't add
          } else {
            // add top route
            childRouteIndexs.add(currentPositionIndex + 8 + 8);
          }
        }
      }
    }

    for (int indx in childRouteIndexs) {
      routeIndexs.add(indx);
    }
  }
}
