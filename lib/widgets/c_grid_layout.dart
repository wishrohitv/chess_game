import 'package:flutter/material.dart';

class CGridLayout extends StatefulWidget {
  final List<Widget> childrens;
  final int? cols;
  const CGridLayout({super.key, required this.childrens, this.cols = 3});

  @override
  State<CGridLayout> createState() => _CGridLayoutState();
}

class _CGridLayoutState extends State<CGridLayout> {
  // Number of rows;
  late int rows;

  @override
  void initState() {
    super.initState();

    // Determine how many row can be drawn based on cols and number of childrens
    int modulo =
        widget.childrens.length % widget.cols!; // if 0 then dont need to add
    int row = widget.childrens.length ~/ widget.cols!;
    if (modulo != 0) {
      rows = row + 1;
    } else {
      rows = row;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < rows; i++)
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: buildLayout(i),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> buildLayout(int row) {
    List<Widget> rowWidgets = [];
    for (int j = 0; j < widget.cols!; j++) {
      int index = row * widget.cols! + j;
      if (index < widget.childrens.length) {
        rowWidgets.add(Expanded(child: widget.childrens[index]));
      } else {
        rowWidgets.add(Expanded(child: Container()));
      }
    }
    return rowWidgets;
  }
}
