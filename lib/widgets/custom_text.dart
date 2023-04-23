import 'package:flutter/material.dart';

Widget customText(String title, {Color? color, double? fontSize}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: fontSize ?? 30,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    ),
  );
}
