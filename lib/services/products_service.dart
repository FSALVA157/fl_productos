import 'dart:convert';

import 'package:flutter/material.dart';
import  'package:http/http.dart'  as http;

import 'package:fl_productos/models/models.dart';


class ProductsService extends ChangeNotifier{

  final String _base_url = "flutter-projects-21726-default-rtdb.firebaseio.com";
  final List<IProduct> products = [];
  bool isLoading = true;
  late IProduct selectedProduct;

  ProductsService(){
    this.loadProducts();
  }

  Future<List<IProduct>>  loadProducts() async{
    /*implementando loading */
    this.isLoading = true;
    notifyListeners();

   final url = Uri.https(_base_url, "products.json");
   final resp = await http.get(url);

   Map<String, dynamic> productsMap = json.decode(resp.body);
   productsMap.forEach((key, value) {
     IProduct tempProduct = IProduct.fromMap(value);
     tempProduct.id = key;
     this.products.add(tempProduct);
    });

    /*implementando loading */
    this.isLoading = false;
    notifyListeners();


    return this.products;
    
  }

}