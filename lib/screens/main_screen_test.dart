// import 'package:chess_game/configs.dart';
// import 'package:chess_game/utils/is_empty.dart';
// import 'package:chess_game/widgets/chess_pieces.dart';
// import 'package:chess_game/widgets/tile.dart';
// import 'package:flutter/material.dart';

// class MainScreenTest extends StatefulWidget {
//   const MainScreenTest({super.key});

//   @override
//   State<MainScreenTest> createState() => _MainScreenTestState();
// }

// class _MainScreenTestState extends State<MainScreenTest> {
//   List<int> cardTileIndex = List.generate(64, (index) => index);

//   final List<int> _indexOfInitalEmptyTiles = List.generate(
//     64 - 8 - 8 - 8 - 8,
//     (index) => index + (8 + 8),
//   );

//   int _indexOfDroppedItem = 0;
//   bool _isDragging = false;

//   // this boolean works on first time
//   bool drawIntialPieces = true;

//   @override
//   void initState() {
//     super.initState();
//     print(_indexOfInitalEmptyTiles);
//   }

//   void _acceptDraggedItem(int index) {
//     setState(() {
//       _indexOfDroppedItem = index;
//       _indexOfInitalEmptyTiles.add(index);
//       print("index of dropped item: $_indexOfDroppedItem");
//       print(_indexOfInitalEmptyTiles);
//     });
//   }

//   void _setIsDragging() {
//     setState(() {
//       _isDragging = true;
//     });
//   }

//   void _resetIsDragging() {
//     setState(() {
//       _isDragging = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Text("Play Chess Game"),
//           Expanded(
//             child: GridView(
//               primary: false,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 8,
//                 mainAxisSpacing: 5,
//                 crossAxisSpacing: 5,
//               ),
//               // children: List.generate(64, (index) {
//               //   int row = index ~/ 8;
//               //   int col = index % 8;
//               //   String pos = (index + 1).toString();
//               //   int tileBool = ((row + col) % 2);
//               //   return renderTile(
//               //     tileBool,
//               //     index,
//               //     isEmpty(
//               //       _indexOfInitalEmptyTiles.first,
//               //       _indexOfInitalEmptyTiles.last,
//               //       index,
//               //     ),
//               //   );
//               //   // if ((row + col) % 2 == 0) {
//               //   //   return whiteTile(pos, pos, index);
//               //   // } else {
//               //   //   return blackTile(pos, pos, index);
//               //   // }
//               // }
//               children: List.generate(cardTileIndex.length, (index) {
//                 int row = index ~/ 8;
//                 int col = index % 8;
//                 int tileBool = ((row + col) % 2);
//                 return renderTile(
//                   tileBool,
//                   cardTileIndex[index],
//                   isEmpty(
//                     _indexOfInitalEmptyTiles.first,
//                     _indexOfInitalEmptyTiles.last,
//                     index,
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget renderTile(int tileBool, int tileIndex, bool isEmptyTile) {
//     return tileAndPieces(
//       tileIndex.toString(),
//       tileIndex,
//       tileBool == 0 ? Colors.white : Colors.black,
//       isEmptyTile,
//     );
//   }

//   Widget tileAndPieces(
//     String? title,
//     int index,
//     Color color,
//     bool isEmptyTile,
//   ) {
//     if (!isEmptyTile) {
//       return Draggable<int>(
//         data: index,
//         childWhenDragging: Tile(
//           color: color,
//           index: index,
//           // returnIndex: (p0) {
//           //   print("index of current selected itme: $p0");
//           //   _indexOfDroppedItem = p0;
//           // },
//         ),
//         feedback: Tile(
//           color: Colors.transparent,
//           index: index,
//           title: title,
//           pieces: returnPieces(isEmptyTile, index),
//         ),
//         child: Tile(
//           color: color,
//           index: index,
//           title: title,
//           pieces: returnPieces(isEmptyTile, index),
//         ),
//         onDragStarted: () {
//           _setIsDragging();
//         },
//         onDraggableCanceled: (_, __) {
//           _resetIsDragging();
//         },
//         onDragCompleted: () {
//           _resetIsDragging();
//         },
//       );
//     }
//     return DragTarget<int>(
//       builder:
//           (
//             BuildContext context,
//             List<dynamic> accepted,
//             List<dynamic> rejected,
//           ) {
//             return Container(
//               height: 100,
//               width: 100,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: _isDragging ? Colors.orange : Colors.blue,
//                   width: _isDragging ? 5.0 : 1.0,
//                 ),
//                 borderRadius: BorderRadius.all(
//                   _isDragging
//                       ? const Radius.circular(20)
//                       : const Radius.circular(10),
//                 ),
//               ),
//               child: Tile(
//                 color: color,
//                 index: index,
//                 // returnIndex: (p0) {
//                 //   print("index of target tile: $p0");
//                 //   // RangeError.checkValidIndex(
//                 //   //   _indexOfDroppedItem,
//                 //   //   cardTileIndex,
//                 //   //   'index1',
//                 //   // );
//                 //   // RangeError.checkValidIndex(p0, cardTileIndex, 'index2');
//                 //   var tmp = cardTileIndex[_indexOfDroppedItem];
//                 //   cardTileIndex[_indexOfDroppedItem] = cardTileIndex[p0];
//                 //   cardTileIndex[p0] = tmp;
//                 //   print(cardTileIndex);

//                 //   setState(() {});
//                 // },
//               ),
//             );
//           },
//       onAcceptWithDetails: (DragTargetDetails<int> details) {
//         _acceptDraggedItem(details.data);
//       },
//     );
//   }

//   Widget returnPieces(bool isTileEmpty, int index) {
//     if (!isTileEmpty && index < 8) {
//       return Pieces(pieceImage: blackPiecesImgPath[index]);
//     } else if (!isTileEmpty && index >= 8 && index < 16) {
//       return BlackSoldierPieces();
//     } else if (!isTileEmpty && index >= 48 && index < 56) {
//       return WhiteSoldierPieces();
//     } else if (!isTileEmpty && index >= 56 && index < 64) {
//       return Pieces(pieceImage: whitePiecesImgPath[63 - index]);
//     } else {
//       // does nothing to the card, insect why
//       return DragTarget<int>(
//         builder:
//             (
//               BuildContext context,
//               List<dynamic> accepted,
//               List<dynamic> rejected,
//             ) {
//               return Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: _isDragging
//                         ? const Color.fromARGB(38, 255, 153, 0)
//                         : Colors.blue,
//                     width: _isDragging ? 5.0 : 1.0,
//                   ),
//                   borderRadius: BorderRadius.all(
//                     _isDragging
//                         ? const Radius.circular(20)
//                         : const Radius.circular(10),
//                   ),
//                 ),
//                 child: Tile(
//                   color: const Color.fromARGB(95, 255, 86, 34),
//                   index: index,
//                   // returnIndex: (p0) {
//                   //   print("index of target tile: $p0");
//                   //   // RangeError.checkValidIndex(
//                   //   //   _indexOfDroppedItem,
//                   //   //   cardTileIndex,
//                   //   //   'index1',
//                   //   // );
//                   //   // RangeError.checkValidIndex(p0, cardTileIndex, 'index2');
//                   //   var tmp = cardTileIndex[_indexOfDroppedItem];
//                   //   cardTileIndex[_indexOfDroppedItem] = cardTileIndex[p0];
//                   //   cardTileIndex[p0] = tmp;
//                   //   print(cardTileIndex);

//                   //   setState(() {});
//                   // },
//                 ),
//               );
//             },
//         onAcceptWithDetails: (DragTargetDetails<int> details) {
//           _acceptDraggedItem(details.data);
//         },
//       );
//     }
//   }
// }
