import 'package:flutter/material.dart';

class CreateText extends StatelessWidget {
  const CreateText(
    this.text,
    this.fontsize,
    this.colors, {
    this.isBold = false,
    Key? key,
  }) : super(key: key);

  final double fontsize;
  final String text;
  final Color colors;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colors,
        fontSize: fontsize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
