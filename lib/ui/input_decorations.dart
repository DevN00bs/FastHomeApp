import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    

    return InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF335C67)
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF335C67),
                    width: 2
                  )
                ),
                hintText: hintText,
                labelText: labelText,
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
                prefixIcon: prefixIcon != null
                  ? Icon( prefixIcon, color: Color(0xFF335C67) ) // if condition up there exists
                  : null //else
              );

  }

}