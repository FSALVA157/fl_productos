import 'dart:io';

import 'package:fl_productos/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductImage extends StatelessWidget {
  final String? url_image;
   
  const ProductImage({Key? key, this.url_image}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        width: double.infinity,
        height: size.height * 0.5,
        decoration: _boxDecoration(),
        child: Opacity(
          opacity: 0.7,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: getImage(url_image)
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
    color: Colors.black12,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.07),
        blurRadius: 10,
        offset: Offset(0,5)
      )
    ]
  );

  Widget getImage(String? picture){
    if(picture == null){
      return Image(image: AssetImage('assets/no-image.png'),fit: BoxFit.contain,);
    }

    if(picture.startsWith('http')){
      return    FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(url_image!),
                fit: BoxFit.contain,
                  );
    }

    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
        


  }


}