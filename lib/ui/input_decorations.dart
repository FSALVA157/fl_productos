import 'package:flutter/material.dart';


class InputDecorations{
  // final Icon icono;

  // InputDecorations({required this.icono});

  static InputDecoration authInputDecoration({required Icon icono, required String hintText}){
    return  InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                    width: 2
                  ),                  
                ),
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo Electronico',
                prefixIcon: icono
              );
  }
}