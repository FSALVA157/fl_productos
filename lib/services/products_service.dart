import 'dart:convert';

import  'package:http/http.dart'  as http;

import 'package:fl_productos/models/product.dart';
import 'package:flutter/cupertino.dart';

class ProductsService extends ChangeNotifier{

  final String _base_url = "flutter-projects-21726-default-rtdb.firebaseio.com";
  final List<IProduct> products = [];
  bool isLoading = true;

  ProductsService(){
    this.loadProducts();
  }

  Future  loadProducts() async{
   final url = Uri.https(_base_url, "products.json");
   final resp = await http.get(url);

   Map<String, dynamic> productsMap = json.decode(resp.body);
   print(productsMap);
    
  }

}