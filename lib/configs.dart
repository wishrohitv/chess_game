class Configs {
  static List<Map<String, String>> blackPiecesImgPath = [
    // piece name : piece path
    {"blackChariot": "lib/assets/images/pieces/black/chariot.png"},
    {"blackHorse": "lib/assets/images/pieces/black/horse.png"},
    {"blackElephant": "lib/assets/images/pieces/black/elephant.png"},
    {"blackMinister": "lib/assets/images/pieces/black/minister.png"},
    {"blackKing": "lib/assets/images/pieces/black/king.png"},
    {"blackElephant": "lib/assets/images/pieces/black/elephant.png"},
    {"blackHorse": "lib/assets/images/pieces/black/horse.png"},
    {"blackChariot": "lib/assets/images/pieces/black/chariot.png"},
  ];

  static List<Map<String, String>> whitePiecesImgPath = [
    // piece name : piece path
    {"whiteChariot": "lib/assets/images/pieces/white/chariot.png"},
    {"whiteHorse": "lib/assets/images/pieces/white/horse.png"},
    {"whiteElephant": "lib/assets/images/pieces/white/elephant.png"},
    {"whiteKing": "lib/assets/images/pieces/white/king.png"},
    {"whiteMinister": "lib/assets/images/pieces/white/minister.png"},
    {"whiteElephant": "lib/assets/images/pieces/white/elephant.png"},
    {"whiteHorse": "lib/assets/images/pieces/white/horse.png"},
    {"whiteChariot": "lib/assets/images/pieces/white/chariot.png"},
  ];

  static Map<String, String> piecesWithPath = {
    "blackChariot": "lib/assets/images/pieces/black/chariot.png",
    "blackHorse": "lib/assets/images/pieces/black/horse.png",
    "blackElephant": "lib/assets/images/pieces/black/elephant.png",
    "blackMinister": "lib/assets/images/pieces/black/minister.png",
    "blackKing": "lib/assets/images/pieces/black/king.png",
    "blackSoldier": "lib/assets/images/pieces/black/soldier.png",
    "whiteChariot": "lib/assets/images/pieces/white/chariot.png",
    "whiteHorse": "lib/assets/images/pieces/white/horse.png",
    "whiteElephant": "lib/assets/images/pieces/white/elephant.png",
    "whiteMinister": "lib/assets/images/pieces/white/minister.png",
    "whiteKing": "lib/assets/images/pieces/white/king.png",
    "whiteSoldier": "lib/assets/images/pieces/white/soldier.png",
  };


  // Chess grid corner lists
  static List<int> gridLeftCornerIndex = [0, 8, 16, 24, 32, 40, 48, 56];
  static List<int> gridTopCornerIndex = [0, 1, 2, 3, 4, 5, 6, 7];

  static List<int> gridRightCornerIndex = [7, 15, 23, 31, 39, 47, 55, 63];
  static List<int> gridBottomCornerIndex = [56, 57, 58, 59, 60, 61, 62, 63];
}
