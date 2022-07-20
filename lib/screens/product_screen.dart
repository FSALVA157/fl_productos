import 'package:fl_productos/themes/global_theme.dart';
import 'package:fl_productos/ui/input_decorations.dart';
import 'package:fl_productos/widgets/product_image.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(),
                Positioned(
                  left: 20,
                  top: 60,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,size: 40,)
                  )
                  ),
                  Positioned(
                  right: 20,
                  top: 60,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt_outlined, color: Colors.white,size: 40,)
                  )
                  )
              ],
            ),
            _ProductForm(),
            SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: (){},
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _decorationForm(),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10,),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  icono: Icons.text_fields,
                  hint_text: 'nombre del producto',
                  label_text: 'Nombre:'
                  ),
              ),

              SizedBox(height: 30,),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  icono: Icons.price_check_sharp,
                  hint_text: '\$150',
                  label_text: 'Precio:'
                  ),
              ),
              SizedBox(height:30,),
              SwitchListTile(
                value: true,
                title: Text('Disponible'),
                activeColor: GlobalTheme.primary,
                onChanged: (value){}
                 ),

              SizedBox(height: 30,)
            ],
          )
          ),
      ),
    );
  }

  BoxDecoration _decorationForm() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.07),
        blurRadius: 10,
        offset: Offset(0,5)
      )
    ]
  );
}
