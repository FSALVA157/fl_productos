import 'package:fl_productos/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Productos")),
      ),
      body: ListView.builder(

        itemBuilder: (BuildContext context, int indice){
          return ProductCard();
        }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add)
          
        ),
    );
  }
}