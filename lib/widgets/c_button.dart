import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String text;
  final Function? onTap;
  const CButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 50.0,
          minWidth: 150.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            style: BorderStyle.solid,
            color: Colors.black,
          ),
          gradient: SweepGradient(
            colors: [
              Colors.green,
              Colors.lightGreenAccent,
              Colors.yellowAccent,
              Colors.lightGreenAccent,
            ],
            endAngle: 30.0,
            startAngle: 0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
