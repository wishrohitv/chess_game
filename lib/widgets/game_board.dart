import 'package:chess_game/configs.dart';
import 'package:chess_game/settings.dart';
import 'package:chess_game/utils/is_empty.dart';
import 'package:chess_game/utils/piece_move_calculate/chariot.dart';
import 'package:chess_game/utils/piece_move_calculate/elephant.dart';
import 'package:chess_game/utils/piece_move_calculate/horse.dart';
import 'package:chess_game/utils/piece_move_calculate/king.dart';
import 'package:chess_game/utils/piece_move_calculate/minister.dart';
import 'package:chess_game/utils/piece_move_calculate/piece.dart';
import 'package:chess_game/utils/piece_move_calculate/soldier.dart';
import 'package:chess_game/utils/tile_color.dart';
import 'package:chess_game/widgets/c_grid_layout.dart';
import 'package:chess_game/widgets/chess_pieces.dart';
import 'package:chess_game/widgets/game_progress.dart';
import 'package:chess_game/widgets/popup_window.dart';
import 'package:chess_game/widgets/tile_container.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<int> cardTileIndex = List.generate(64, (index) => index);

  // This list hold the each game tile and with pieces and without pieces(empty)
  late List<Widget> gameBoardWithPieces;

  // This list keeps track of initial piece position
  final List<int> _indexOfInitalEmptyTiles = List.generate(
    64 - 8 - 8 - 8 - 8,
    (index) => index + (8 + 8),
  );

  // This variable hold choosed pices index to be moved
  int? currentSelectedPieceIndex;
  // This variable hold choosed pices Name to be moved
  String currentSelectedPieceName =
      "white"; // we know first start with white piece

  // This
  int? locationIndexOfChoosedToMovePiece;

  // This boolean is for track which tile empty and
  // make highlighted when piece choosed to move and show route
  ValueNotifier<Map<String, dynamic>> showMovesRoute = ValueNotifier({
    "isShow": false,
    "nextRoute": [],
  });

  // Game State
  bool isGameStarted = false;
  bool isWhiteTurn = true;
  bool isBlackTurn = false;

  List<int> blackPiecesIndex = List.generate(16, (indx) => indx);
  List<int> whitePiecesIndex = List.generate(16, (indx) => indx + 48);

  List<Widget> pieceKilledByWhite = [];
  List<Widget> pieceKilledByBlack = [];

  // Player black state
  ValueNotifier<Map<String, dynamic>> whitePlayerStateNotifier = ValueNotifier({
    "state": true,
    "secondLeft": 600,
  });
  int? whitePlayerTimeLeft;
  int? blackPlayerTimeLeft;
  // Player black state
  ValueNotifier<Map<String, dynamic>> blackPlayerStateNotifier = ValueNotifier({
    "state": false,
    "secondLeft": 600,
  });

  Piece? piece;
  @override
  void initState() {
    super.initState();
    drawInitialBoardWithPiece();

    // Match time duration
    whitePlayerTimeLeft = whitePlayerStateNotifier.value["secondLeft"] as int;
    blackPlayerTimeLeft = blackPlayerStateNotifier.value["secondLeft"] as int;
  }

  void drawInitialBoardWithPiece() {
    gameBoardWithPieces = List.generate(cardTileIndex.length, (index) {
      int row = index ~/ 8;
      int col = index % 8;
      int tileBool = ((row + col) % 2);
      return renderTile(
        tileBool,
        cardTileIndex[index],
        isEmpty(
          _indexOfInitalEmptyTiles.first,
          _indexOfInitalEmptyTiles.last,
          index,
        ),
      );
    });
  }

  void choosedTileCallback(
    int indexW,
    String userMovePieceName,
    bool isValidRoutePosition,

    /// used for checking if user choosed piece to kill it
  ) {
    /// This logic help to kill piece
    // ----
    if (isValidRoutePosition && isWhiteTurn) {
      emptyTileCallback(
        "title",
        indexW,
        indexW,
        userMovePieceName,
        isValidRoutePosition,
      );
      return;
    } else if (isValidRoutePosition && isBlackTurn) {
      emptyTileCallback(
        "title",
        indexW,
        indexW,
        userMovePieceName,
        isValidRoutePosition,
      );
      return;
    } else {
      // let below logic happen
    }
    // ----

    // Assign indexW and piece name to global variables
    setState(() {
      currentSelectedPieceIndex = indexW;
      currentSelectedPieceName = userMovePieceName;
    });

    // Reset move route highlights if another piece is choosed or invaild route
    showMovesRoute.value = {"isShow": false, "nextRoute": []};

    if (isWhiteTurn &&
        currentSelectedPieceName.substring(0, 5) == "white" &&
        isBlackTurn == false) {
      // print("isBlackTurn: $isBlackTurn");
    } else if (isBlackTurn &&
        currentSelectedPieceName.substring(0, 5) == "black" &&
        isWhiteTurn == false) {
      // print("isWhiteTurn: $isWhiteTurn");
    } else {
      // print("isWhiteTurn: $isWhiteTurn xxxxx");
      // print("isBlackTurn: $isBlackTurn zzzzz");
      return;
    }

    if (userMovePieceName == "blackChariot" ||
        userMovePieceName == "whiteChariot") {
      piece = Chariot(
        currentPositionIndex: indexW,
        userPiecesIndexList: isWhiteTurn ? whitePiecesIndex : blackPiecesIndex,
        enemyPiecesIndexList: !isWhiteTurn
            ? whitePiecesIndex
            : blackPiecesIndex,
      );
    } else if (userMovePieceName == "blackHorse" ||
        userMovePieceName == "whiteHorse") {
      piece = Horse(
        currentPositionIndex: indexW,
        userPiecesIndexList: isWhiteTurn ? whitePiecesIndex : blackPiecesIndex,
        enemyPiecesIndexList: !isWhiteTurn
            ? whitePiecesIndex
            : blackPiecesIndex,
      );
    } else if (userMovePieceName == "blackElephant" ||
        userMovePieceName == "whiteElephant") {
      piece = Elephant(
        currentPositionIndex: indexW,
        userPiecesIndexList: isWhiteTurn ? whitePiecesIndex : blackPiecesIndex,
        enemyPiecesIndexList: !isWhiteTurn
            ? whitePiecesIndex
            : blackPiecesIndex,
      );
    } else if (userMovePieceName == "blackMinister" ||
        userMovePieceName == "whiteMinister") {
      piece = Minister(
        currentPositionIndex: indexW,
        userPiecesIndexList: isWhiteTurn ? whitePiecesIndex : blackPiecesIndex,
        enemyPiecesIndexList: !isWhiteTurn
            ? whitePiecesIndex
            : blackPiecesIndex,
      );
    } else if (userMovePieceName == "blackKing" ||
        userMovePieceName == "whiteKing") {
      piece = King(
        currentPositionIndex: indexW,
        userPiecesIndexList: isWhiteTurn ? whitePiecesIndex : blackPiecesIndex,
        enemyPiecesIndexList: !isWhiteTurn
            ? whitePiecesIndex
            : blackPiecesIndex,
      );
    } else if (userMovePieceName == "blackSoldier" ||
        userMovePieceName == "whiteSoldier") {
      piece = Soldier(
        currentPositionIndex: indexW,
        pieceName: userMovePieceName,
        userPiecesIndexList: isWhiteTurn ? whitePiecesIndex : blackPiecesIndex,
        enemyPiecesIndexList: !isWhiteTurn
            ? whitePiecesIndex
            : blackPiecesIndex,
      );
    }

    // When valid piece selected highlight it valid route
    showMovesRoute.value = {"isShow": true, "nextRoute": piece!.routeIndexs};

    print("current selected index piece $indexW, $userMovePieceName");
  }

  // Empty tile callback
  void emptyTileCallback(
    String? title,
    int index,
    int indexS,
    String pieceNameE,
    bool isValidRoutePosition,
  ) {
    // if (showMovesRoute.value) {
    if (showMovesRoute.value['isShow']) {
      // make show moves route false
      // showMovesRoute.value = false;
      showMovesRoute.value = {"isShow": false, "nextRoute": []};
      print("index of target tile: $indexS, $pieceNameE");

      // Check if user clicked valid route
      if (isValidRoutePosition) {
        //
        if (isWhiteTurn) {
          isBlackTurn = true;
          isWhiteTurn = false;
        } else if (isBlackTurn) {
          isWhiteTurn = true;
          isBlackTurn = false;
        }
      } else {
        return;
      }

      setState(() {
        locationIndexOfChoosedToMovePiece = index;
        // add seleceted piece to choosed position/index
        gameBoardWithPieces[indexS] = pieceTileContainer(
          locationIndexOfChoosedToMovePiece!.toString(),
          locationIndexOfChoosedToMovePiece!,
          tileColorBool(locationIndexOfChoosedToMovePiece!) == 0
              ? whiteTileColor
              : blackTileColor,
          currentSelectedPieceName,
        );

        // remove current seleceted position's pieces and add empty tile
        gameBoardWithPieces[currentSelectedPieceIndex!] = emptyTileContainer(
          currentSelectedPieceIndex!.toString(),
          currentSelectedPieceIndex!,
          tileColorBool(currentSelectedPieceIndex!) == 0
              ? whiteTileColor
              : blackTileColor,
        );
      });

      // Update pieces indexes
      if (currentSelectedPieceName.substring(0, 5) == "white") {
        whitePiecesIndex.remove(currentSelectedPieceIndex); // remove
        whitePiecesIndex.add(
          locationIndexOfChoosedToMovePiece!,
        ); // add new index where it is moved
        // If white kill black pieces then remove its index from blackPiecesIndex
        if (blackPiecesIndex.contains(locationIndexOfChoosedToMovePiece!)) {
          blackPiecesIndex.remove(locationIndexOfChoosedToMovePiece!);

          // And add it
          pieceKilledByWhite.add(
            Pieces(
              pieceImage: Configs.piecesWithPath[pieceNameE]!,
              pieceName: "pieceName",
            ),
          );

          // Show game result when king gotcheckmate
          if (pieceNameE == "blackKing") {
            showResult(context, "White player won the match");
          } else {
            // Here if soldier reach top corner then force user to choose new piece
            if (Configs.gridTopCornerIndex.contains(
                  locationIndexOfChoosedToMovePiece,
                ) &&
                currentSelectedPieceName == "whiteSoldier") {
              // Open dialog box
              pickNewPieceDialog(
                context,
                "white",
                choosedNewPieceName: (choosedNewPieceName) {
                  // add seleceted piece to choosed position/index
                  gameBoardWithPieces[indexS] = pieceTileContainer(
                    locationIndexOfChoosedToMovePiece!.toString(),
                    locationIndexOfChoosedToMovePiece!,
                    tileColorBool(locationIndexOfChoosedToMovePiece!) == 0
                        ? whiteTileColor
                        : blackTileColor,
                    choosedNewPieceName,
                  );
                  setState(() {});
                },
              );
            }
          }
        }

        // player game state
        whitePlayerStateNotifier.value = {
          "state": false,
          "secondLeft": whitePlayerTimeLeft,
        };
        blackPlayerStateNotifier.value = {
          "state": true,
          "secondLeft": blackPlayerTimeLeft,
        };
      } else if (currentSelectedPieceName.substring(0, 5) == "black") {
        blackPiecesIndex.remove(currentSelectedPieceIndex); // remove
        blackPiecesIndex.add(
          locationIndexOfChoosedToMovePiece!,
        ); // add new index where it is moved

        // If black kill white pieces then remove its index from blackPiecesIndex
        if (whitePiecesIndex.contains(locationIndexOfChoosedToMovePiece!)) {
          whitePiecesIndex.remove(locationIndexOfChoosedToMovePiece!);

          // And add it
          pieceKilledByBlack.add(
            Pieces(
              pieceImage: Configs.piecesWithPath[pieceNameE]!,
              pieceName: "pieceName",
            ),
          );

          // Show game result when king checkmate
          if (pieceNameE == "whiteKing") {
            showResult(context, "Black player won the match");
          } else {
            // Here if soldier reach bottom corner then force user to choose new piece
            if (Configs.gridBottomCornerIndex.contains(
                  locationIndexOfChoosedToMovePiece,
                ) &&
                currentSelectedPieceName == "blackSoldier") {
              // Open dialog box
              pickNewPieceDialog(
                context,
                "black",
                choosedNewPieceName: (choosedNewPieceName) {
                  // add seleceted piece to choosed position/index
                  gameBoardWithPieces[indexS] = pieceTileContainer(
                    locationIndexOfChoosedToMovePiece!.toString(),
                    locationIndexOfChoosedToMovePiece!,
                    tileColorBool(locationIndexOfChoosedToMovePiece!) == 0
                        ? whiteTileColor
                        : blackTileColor,
                    choosedNewPieceName,
                  );
                  setState(() {});
                },
              );
            }
          }
        }

        // player game state
        whitePlayerStateNotifier.value = {
          "state": true,
          "secondLeft": whitePlayerTimeLeft,
        };
        blackPlayerStateNotifier.value = {
          "state": false,
          "secondLeft": blackPlayerTimeLeft,
        };
      }
      // print("white piece index list:  $whitePiecesIndex");
      // print("black piece index list:  $blackPiecesIndex");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Development mode widget help in development
        developmentMode
            ? SizedBox(
                height: 60.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Current selected piece name",
                          style: TextStyle(
                            backgroundColor: const Color.fromARGB(
                              255,
                              245,
                              84,
                              223,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(currentSelectedPieceName),

                        SizedBox(width: 5.0),

                        Text(
                          "Selected Piece valid route ",
                          style: TextStyle(
                            backgroundColor: const Color.fromARGB(
                              255,
                              230,
                              217,
                              40,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        // Text(showMovesRoute.value['nextRoute'].toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Current selected Index",
                          style: TextStyle(backgroundColor: Colors.blue),
                        ),
                        SizedBox(width: 8.0),
                        Text(currentSelectedPieceIndex.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Moving selected piece to choosed index",
                          style: TextStyle(
                            backgroundColor: const Color.fromARGB(
                              255,
                              72,
                              237,
                              77,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(locationIndexOfChoosedToMovePiece.toString()),

                        SizedBox(width: 5),
                        isWhiteTurn
                            ? Text(
                                "white turn: true",
                                style: TextStyle(
                                  backgroundColor: Colors.purpleAccent,
                                ),
                              )
                            : Text(
                                "black turn: true",
                                style: TextStyle(
                                  backgroundColor: Colors.blueGrey,
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              )
            : Container(),

        // Black game progress
        GameProgress(
          killedPiecesList: pieceKilledByBlack,
          timeLeftnClockState: blackPlayerStateNotifier,
          opponentPlayer: "White",
          returnLeftSecond: (p0) {
            blackPlayerTimeLeft = p0;
          },
        ),
        CGridLayout(childrens: gameBoardWithPieces, cols: 8),

        // White game progress
        GameProgress(
          killedPiecesList: pieceKilledByWhite,
          timeLeftnClockState: whitePlayerStateNotifier,
          opponentPlayer: "Black",
          returnLeftSecond: (p0) {
            whitePlayerTimeLeft = p0;
          },
        ),
      ],
    );
  }

  Widget renderTile(int tileBool, int tileIndex, bool isEmptyTile) {
    return tileAndPieces(
      tileIndex.toString(),
      tileIndex,
      tileBool == 0 ? whiteTileColor : blackTileColor,
      isEmptyTile,
    );
  }

  Widget tileAndPieces(
    String? title,
    int index,
    Color color,
    bool isEmptyTile,
  ) {
    String? tilePieceName;

    if (!isEmptyTile && index < 8) {
      tilePieceName = Configs.blackPiecesImgPath[index].keys.first;
    } else if (!isEmptyTile && index >= 8 && index < 16) {
      tilePieceName = "blackSoldier";
    } else if (!isEmptyTile && index >= 48 && index < 56) {
      tilePieceName = "whiteSoldier";
    } else if (!isEmptyTile && index >= 56 && index < 64) {
      tilePieceName = Configs.whitePiecesImgPath[63 - index].keys.first;
    }
    if (!isEmptyTile) {
      // tile with pieces
      return TileContainer(
        color: color,
        index: index,
        title: title,
        piecesName: tilePieceName,
        pieces: returnPieces(isEmptyTile, index),
        showMoveRoutes: showMovesRoute,
        emptyTileCallback: (indexW, userMovePieceName, isValidRoutePosition) {
          choosedTileCallback(indexW, userMovePieceName, isValidRoutePosition);
        },
      );
    }
    // tiles with empty
    return TileContainer(
      color: color,
      index: index,
      title: title,
      piecesName: tilePieceName,
      showMoveRoutes: showMovesRoute,
      emptyTileCallback: (indexS, pieceNameE, isValidRoutePosition) {
        emptyTileCallback(
          title,
          index,
          indexS,
          pieceNameE,
          isValidRoutePosition,
        );
      },
    );
  }

  Widget returnPieces(bool isTileEmpty, int index) {
    if (!isTileEmpty && index < 8) {
      return Pieces(
        pieceName: Configs.blackPiecesImgPath[index].keys.first,
        pieceImage: Configs.blackPiecesImgPath[index].values.first,
      );
    } else if (!isTileEmpty && index >= 8 && index < 16) {
      return BlackSoldierPieces();
    } else if (!isTileEmpty && index >= 48 && index < 56) {
      return WhiteSoldierPieces();
    } else if (!isTileEmpty && index >= 56 && index < 64) {
      return Pieces(
        pieceName: Configs.whitePiecesImgPath[63 - index].keys.first,
        pieceImage: Configs.whitePiecesImgPath[63 - index].values.first,
      );
    } else {
      // does nothing to the card,
      return TileContainer(color: Colors.blue, index: index);
    }
  }

  Widget pieceTileContainer(
    String? title,
    int index,
    Color color,
    String pieceName,
  ) {
    return TileContainer(
      color: color,
      index: index,
      title: title,
      piecesName: pieceName,
      pieces: Pieces(
        pieceImage: Configs.piecesWithPath[pieceName]!,
        pieceName: pieceName,
      ),
      showMoveRoutes: showMovesRoute,
      emptyTileCallback: (indexW, userMovePieceName, isValidRoutePosition) {
        choosedTileCallback(indexW, userMovePieceName, isValidRoutePosition);
      },
    );
  }

  Widget emptyTileContainer(String? title, int index, Color color) {
    return TileContainer(
      color: color,
      index: index,
      title: title,
      showMoveRoutes: showMovesRoute,
      emptyTileCallback: (indexS, pieceNameE, isValidRoutePosition) {
        emptyTileCallback(
          title,
          index,
          indexS,
          pieceNameE,
          isValidRoutePosition,
        );
      },
    );
  }
}
