int tileColorBool(int index) {
  int row = index ~/ 8;
  int col = index % 8;
  int tileBool = ((row + col) % 2);
  return tileBool;
}
