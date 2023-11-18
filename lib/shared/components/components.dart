import 'package:flutter/material.dart';

Text getTitleText(
        {String text = "BMI Calculator",
        FontWeight fontWeight = FontWeight.bold,
        Color color = Colors.white}) =>
    Text(
      text,
      style: TextStyle(fontWeight: fontWeight, color: color),
    );
