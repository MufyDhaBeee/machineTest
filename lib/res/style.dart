import 'package:flutter/material.dart';

customStyle( var fontSize, var color, var fontWeight) {
  return TextStyle(
    fontSize: double.parse(fontSize.toString()),
    color: color,
    fontWeight: fontWeight,
  );
}
customStyleLineThrough(var fontSize, var color, var fontWeight) {
  return TextStyle(
    fontSize: double.parse(fontSize.toString()),
    color: color,
    fontWeight: fontWeight,
    decoration: TextDecoration.lineThrough,
  );
}