
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
   
  const CardContainer({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          width: double.infinity,
          height: 300,
          
          decoration: _DecorationCard(),
          child: Center(child: Text('Login', style: TextStyle(fontSize: 30),)),
      ),
    );
  }

  BoxDecoration _DecorationCard() => BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: Colors.white,
  );
}