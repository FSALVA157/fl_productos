import 'package:fl_productos/models/models.dart';
import 'package:fl_productos/themes/global_theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final IProduct producto;
  const ProductCard({Key? key, required this.producto}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: _cardBorders(),
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
         child: Stack(
           alignment: Alignment.bottomLeft,
           children:  [
             _BackgroundImage(url_imagen: this.producto.picture),
              _ProductDetail(prod: producto),
              Positioned(
                top: 0,
                right: 0,
                child: _Prize(precio: this.producto.price.toString(),)),
              Positioned(
                top:0,
                left: 0,
                child: (this.producto.available)? Container(): _NotAvailable()
                )              
           ],
         )
      ),
      );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: Colors.white,
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 10)
              )
    ]
  );
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child:  Text('No Disponible', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center)
          ),
          ),
       decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), topLeft: Radius.circular(25))
      ),
         );
  }
}

class _Prize extends StatelessWidget {
  final String precio;
  const _Prize({
    Key? key, required this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.30,
      height: 50,
      decoration: BoxDecoration(
        color: GlobalTheme.primary,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25))
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text('\$${this.precio}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center)),
      padding: EdgeInsets.symmetric(vertical: 15),
    );
  }
}

class _ProductDetail extends StatelessWidget {
  final IProduct prod;
  const _ProductDetail({
    Key? key, required this.prod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: size.width * 0.60,
        height: 70,
        color: GlobalTheme.primary,      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.prod.name, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),maxLines: 1, overflow: TextOverflow.ellipsis,),
            Text(this.prod.name, style: TextStyle(color: Colors.white, fontSize: 15 ),maxLines: 1, overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? url_imagen;
  
  const _BackgroundImage({
    Key? key,  this.url_imagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: (this.url_imagen != null)? 
          FadeInImage(
              image:  NetworkImage(this.url_imagen!),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fit: BoxFit.contain,
            ): 
            Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.contain,),
      ),
    );
  }
}