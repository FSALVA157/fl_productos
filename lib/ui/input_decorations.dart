import 'package:flutter/material.dart';


class InputDecorations{
  // final Icon icono;

  // InputDecorations({required this.icono});

  static InputDecoration authInputDecoration({required IconData icono, required String hint_text, required label_text}){
    return  InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                    width: 2
                  ),                  
                ),
                hintText: hint_text,
                labelText: label_text,
                prefixIcon: (icono != null)? Icon(icono, color: Colors.deepPurple,): null
              );
  }
}