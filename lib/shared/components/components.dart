import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget getTitleText(
        {String text = "BMI Calculator",
        FontWeight fontWeight = FontWeight.bold,
        Color color = Colors.white}) =>
    Text(
      text,
      style: TextStyle(fontWeight: fontWeight, color: color),
    );

Widget getDefaultTextField(
        {required TextEditingController controller,
        required TextInputType textInputType,
        required IconData prefix,
        required String label,
        bool isPassword = false,
        Function? validator,
        IconData? suffix}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffix: suffix != null ? Icon(suffix) : null,
        labelText: (label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email cannot be empty";
        }

        return null;
      },
    );
