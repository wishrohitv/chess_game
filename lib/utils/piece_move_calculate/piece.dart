abstract class Piece {
  int currentPositionIndex;
  String? pieceName;
  List<int> userPiecesIndexList;
  List<int> enemyPiecesIndexList;
  Piece({
    required this.currentPositionIndex,
    this.pieceName,
    required this.userPiecesIndexList,
    required this.enemyPiecesIndexList,
  });
  
  List<int> routeIndexs = [];
}
