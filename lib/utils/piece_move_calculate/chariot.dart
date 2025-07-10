import 'package:chess_game/configs.dart';
import 'package:chess_game/utils/piece_move_calculate/piece.dart';

class Chariot implements Piece {
  @override
  int currentPositionIndex;

  @override
  List<int> enemyPiecesIndexList;

  @override
  List<int> userPiecesIndexList;
  Chariot({
    required this.currentPositionIndex,
    required this.userPiecesIndexList,
    required this.enemyPiecesIndexList,
  }) {
    calculateRouteIndexXleft();
    calculateRouteIndexXright();
    calculateRouteIndexYup();
    calculateRouteIndexYdown();
  }

  @override
  String? pieceName;

  @override
  List<int> routeIndexs = [];

  void calculateRouteIndexXleft() {
    bool condition = true;
    List<int> childRouteIndex = [];
    while (condition) {
      int lastNextIndex = childRouteIndex.isEmpty
          ? (currentPositionIndex - 1)
          : childRouteIndex.last - 1;
      if (Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
        // it means piece is on corner of bottom indexes
        condition = false; // stop the loop
      } else {
        // Check if next route is user's pieces exist or not

        if (userPiecesIndexList.contains(lastNextIndex)) {
          condition = false;
        } else if (enemyPiecesIndexList.contains(lastNextIndex)) {
          // Add this index as valid rout
          childRouteIndex.add(lastNextIndex);
          condition = false;
        } else {
          if (Configs.gridLeftCornerIndex.contains(lastNextIndex)) {
            // Add this index as valid route
            childRouteIndex.add(lastNextIndex);
            condition = false;
          } else {
            // Add this index as valid route
            childRouteIndex.add(lastNextIndex);
          }
        }
      }
    }
    // Add child route index to parent
    for (var index in childRouteIndex) {
      routeIndexs.add(index);
    }
  }

  void calculateRouteIndexXright() {
    bool condition = true;
    List<int> childRouteIndex = [];
    while (condition) {
      int lastNextIndex = childRouteIndex.isEmpty
          ? (currentPositionIndex + 1)
          : childRouteIndex.last + 1;
      if (Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
        // it means piece is on corner of bottom indexes
        condition = false; // stop the loop
      } else {
        // Check if next route is user's pieces exist or not

        if (userPiecesIndexList.contains(lastNextIndex)) {
          condition = false;
        } else if (enemyPiecesIndexList.contains(lastNextIndex)) {
          // Add this index as valid rout
          childRouteIndex.add(lastNextIndex);
          condition = false;
        } else {
          if (Configs.gridRightCornerIndex.contains(lastNextIndex)) {
            // Add this index as valid route
            childRouteIndex.add(lastNextIndex);
            condition = false;
          } else {
            // Add this index as valid route
            childRouteIndex.add(lastNextIndex);
          }
        }
      }
    }
    // Add child route index to parent
    for (var index in childRouteIndex) {
      routeIndexs.add(index);
    }
  }

  void calculateRouteIndexYup() {
    bool condition = true;
    List<int> childRouteIndex = [];
    while (condition) {
      int lastNextIndex = childRouteIndex.isEmpty
          ? (currentPositionIndex - 8)
          : childRouteIndex.last - 8;
      if (Configs.gridTopCornerIndex.contains(currentPositionIndex)) {
        // it means piece is on corner of bottom indexes
        condition = false; // stop the loop
      } else {
        // Check if next route is user's pieces exist or not

        if (userPiecesIndexList.contains(lastNextIndex)) {
          condition = false;
        } else if (enemyPiecesIndexList.contains(lastNextIndex)) {
          // Add this index as valid rout
          childRouteIndex.add(lastNextIndex);
          condition = false;
        } else {
          if (Configs.gridTopCornerIndex.contains(lastNextIndex)) {
            // Add this index as valid route
            childRouteIndex.add(lastNextIndex);
            condition = false;
          } else {
            // Add this index as valid route
            childRouteIndex.add(lastNextIndex);
          }
        }
      }
    }
    // Add child route index to parent
    for (var index in childRouteIndex) {
      routeIndexs.add(index);
    }
  }

  void calculateRouteIndexYdown() {
    bool condition = true;
    List<int> childRouteIndex = [];
    while (condition) {
      int lastNextIndex = childRouteIndex.isEmpty
          ? (currentPositionIndex + 8)
          : childRouteIndex.last + 8;
      if (Configs.gridBottomCornerIndex.contains(currentPositionIndex)) {
        // it means piece is on corner of bottom indexes
        condition = false; // stop the loop
      } else {
        // Check if next route is user's pieces exist or not

        if (userPiecesIndexList.contains(lastNextIndex)) {
          condition = false;
        } else if (enemyPiecesIndexList.contains(lastNextIndex)) {
          // Add this index as valid rout
          childRouteIndex.add(lastNextIndex);
          condition = false;
        } else {
          if (Configs.gridBottomCornerIndex.contains(lastNextIndex)) {
            // Add this index as valid route
            childRouteIndex.add(lastNextIndex);
            condition = false;
          } else {
            // Add this index as valid route
            childRouteIndex.add(lastNextIndex);
          }
        }
      }
    }
    // Add child route index to parent
    for (var index in childRouteIndex) {
      routeIndexs.add(index);
    }
  }
}
