import 'package:chess_game/configs.dart';
import 'package:chess_game/utils/piece_move_calculate/piece.dart';

class Minister implements Piece {
  // aka Vazir or Queen
  @override
  int currentPositionIndex;

  @override
  List<int> enemyPiecesIndexList;

  @override
  List<int> userPiecesIndexList;
  Minister({
    required this.currentPositionIndex,
    required this.userPiecesIndexList,
    required this.enemyPiecesIndexList,
  }) {
    // vertical and horizontal moves
    calculateRouteIndexXleft();
    calculateRouteIndexXright();
    calculateRouteIndexYup();
    calculateRouteIndexYdown();

    // diagonal moves
    // top
    calculateRouteYupLeft();
    calculateRouteYupRight();
    // bottom
    calculateRouteYdownLeft();
    calculateRouteYdownRight();
  }

  @override
  String? pieceName;

  @override
  List<int> routeIndexs = [];

  /// vertical and horizontal move
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

  /// digonal moves
  void calculateRouteYupLeft() {
    bool condition = true;
    List<int> childRouteIndex = [];
    while (condition) {
      int lastNextIndex = childRouteIndex.isEmpty
          ? (currentPositionIndex - 8 - 1)
          : childRouteIndex.last - 8 - 1;
      if (Configs.gridLeftCornerIndex.contains(currentPositionIndex) ||
          Configs.gridTopCornerIndex.contains(currentPositionIndex)) {
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
          if (Configs.gridLeftCornerIndex.contains(lastNextIndex) ||
              Configs.gridTopCornerIndex.contains(lastNextIndex)) {
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

  void calculateRouteYupRight() {
    bool condition = true;
    List<int> childRouteIndex = [];
    while (condition) {
      int lastNextIndex = childRouteIndex.isEmpty
          ? (currentPositionIndex - 8 + 1)
          : childRouteIndex.last - 8 + 1;
      if (Configs.gridRightCornerIndex.contains(currentPositionIndex) ||
          Configs.gridTopCornerIndex.contains(currentPositionIndex)) {
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
          if (Configs.gridRightCornerIndex.contains(lastNextIndex) ||
              Configs.gridTopCornerIndex.contains(lastNextIndex)) {
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

  void calculateRouteYdownLeft() {
    bool condition = true;
    List<int> childRouteIndex = [];
    while (condition) {
      int lastNextIndex = childRouteIndex.isEmpty
          ? (currentPositionIndex + 8 - 1)
          : childRouteIndex.last + 8 - 1;
      if (Configs.gridBottomCornerIndex.contains(currentPositionIndex) ||
          Configs.gridLeftCornerIndex.contains(currentPositionIndex)) {
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
          if (Configs.gridBottomCornerIndex.contains(lastNextIndex) ||
              Configs.gridLeftCornerIndex.contains(lastNextIndex)) {
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

  void calculateRouteYdownRight() {
    bool condition = true;
    List<int> childRouteIndex = [];
    while (condition) {
      int lastNextIndex = childRouteIndex.isEmpty
          ? (currentPositionIndex + 8 + 1)
          : childRouteIndex.last + 8 + 1;
      if (Configs.gridBottomCornerIndex.contains(currentPositionIndex) ||
          Configs.gridRightCornerIndex.contains(currentPositionIndex)) {
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
          if (Configs.gridBottomCornerIndex.contains(lastNextIndex) ||
              Configs.gridRightCornerIndex.contains(lastNextIndex)) {
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
