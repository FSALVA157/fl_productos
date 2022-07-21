import 'package:fl_productos/models/models.dart';
import 'package:fl_productos/screens/screens.dart';
import 'package:fl_productos/services/services.dart';
import 'package:fl_productos/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductsService>(context);
    
    return (_products.isLoading)?
       LoadingScreen():
      Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Productos")),
      ),
      body: ListView.builder(
        itemCount: _products.products.length,
        itemBuilder: (BuildContext context, int indice){
          return GestureDetector(
            onTap: () {
              _products.selectedProduct = _products.products[indice].copy();
              Navigator.pushNamed(context, 'product');
            } ,
            child: ProductCard(producto: _products.products[indice],)
            );
        }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add)
          
        ),
    );
  }
}