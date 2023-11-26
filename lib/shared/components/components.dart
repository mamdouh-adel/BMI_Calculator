import 'package:flutter/material.dart';

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
        IconData? suffixIcon,
        Function? validator,
        passwordVisibilityAction}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffix: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon), onPressed: passwordVisibilityAction)
            : null,
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
