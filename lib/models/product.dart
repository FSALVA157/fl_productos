// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class IProduct {
    IProduct({
        required this.available,
        required this.name,
        this.picture,
        required this.price,
        this.id
    });

    bool available;
    String name;
    String? picture;
    double price;
    String? id;

    factory IProduct.fromJson(String str) => IProduct.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory IProduct.fromMap(Map<String, dynamic> json) => IProduct(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
    };

    IProduct copy() => IProduct(
      available:  this.available,
      name:  this.name,
      picture:  this.picture,
      price: this.price,
      id:  this.id
      );




}
