import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import  'package:http/http.dart'  as http;

import 'package:fl_productos/models/models.dart';


class ProductsService extends ChangeNotifier{

  final String _base_url = "flutter-projects-21726-default-rtdb.firebaseio.com";
  final List<IProduct> products = [];
  bool isLoading = true;
  bool isSaving = false;
  late IProduct selectedProduct;
  File? newPictureFile;

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

  Future saveOrCreateProduct(IProduct producto)async{
    this.isSaving = true;
    notifyListeners();

    if(producto.id == null){
      await createProduct(producto);
    }else{
        await updateProduct(producto);
    }


    this.isSaving = false;
    notifyListeners();
  }

  Future<String> createProduct(IProduct dataProduct)async{
    final url = Uri.https(_base_url, "products/${dataProduct.id}.json");
    final resp = await http.post(url, body: dataProduct.toJson());    
    final decodedData = json.decode(resp.body);
    //la respuesta de firebase viene en un objeto {'name': id}
    dataProduct.id = decodedData['name'];
    
    //actualizando la lista
    this.products.add(dataProduct);
    // products[index] = dataProduct;

    // return dataProduct.id!;
    return dataProduct.id!;
  }

  Future<String> updateProduct(IProduct dataProduct)async{
    final url = Uri.https(_base_url, "products/${dataProduct.id}.json");
    final resp = await http.put(url, body: dataProduct.toJson());    
    final decodedData = resp.body;
    
    //actualizando la lista
    final index = this.products.indexWhere((element) => element.id == dataProduct.id);
    products[index] = dataProduct;

    return dataProduct.id!;
  }

  void updateSelectedProductImage(String path){
    this.selectedProduct.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }


}