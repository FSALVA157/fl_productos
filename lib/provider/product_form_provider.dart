
import 'package:fl_productos/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  IProduct producto;

  ProductFormProvider(this.producto){}

  updateAvailable(bool valor){
     this.producto.available = valor;
     
      notifyListeners();     
  }


  bool isValid(){
    
    return formKey.currentState?.validate() ?? false;
  }






}