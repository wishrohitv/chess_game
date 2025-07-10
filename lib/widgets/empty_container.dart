import 'package:flutter/material.dart';

class EmptyContainer extends StatelessWidget {
  final int index;
  final void Function(int)? emptyTileCallback;
  const EmptyContainer({
    super.key,
    required this.index,
    this.emptyTileCallback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (emptyTileCallback != null) {
          emptyTileCallback!(index);
        }
        // print("Callback exists? ${emptyTileCallback != null}");
        // print("Callback runtimeType: ${emptyTileCallback.runtimeType}");
        // print(index);
      },
      // onHover: (value) {
      //   overCallback!(index);
      //   print(index);
      // },
      child: Stack(
        children: [
          Text(
            index.toString(),
            style: TextStyle(
              backgroundColor: Color.fromARGB(150, 255, 255, 255),
            ),
          ),
          SizedBox( height: 100, width: 100,),
        ],
      ),
    );
  }
}
