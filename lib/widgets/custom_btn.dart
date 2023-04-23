import 'package:flutter/material.dart';

Widget customButton(String title, double size,
    {Color? color, Color? textColor}) {
  return Container(
    alignment: Alignment.center,
    height: size * 0.5,
    width: size,
    decoration: BoxDecoration(
      color: color ?? Colors.blue,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Text(
      title,
      style: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: size * 0.2,
      ),
    ),
  );
}
