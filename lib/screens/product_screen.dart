import 'package:flutter/material.dart';
import 'package:fl_productos/services/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:fl_productos/themes/global_theme.dart';
import 'package:fl_productos/ui/input_decorations.dart';
import 'package:fl_productos/widgets/product_image.dart';
import 'package:fl_productos/provider/product_form_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsService>(context);

    return  ChangeNotifierProvider(
        create: (_) => ProductFormProvider(productProvider.selectedProduct),
        child: _productScreenBody(productProvider: productProvider),
      );
    
       
    
  }
}

class _productScreenBody extends StatelessWidget {
  const _productScreenBody({
    Key? key,
    required this.productProvider,
  }) : super(key: key);

  final ProductsService productProvider;

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<ProductFormProvider>(context);


    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(url_image: productProvider.selectedProduct.picture),
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
                    onPressed: () async{
                      final ImagePicker _picker = new ImagePicker();
                      final XFile? pickedFile = await _picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 100
                        );
                        if(pickedFile == null){
                          print('No seleccionó nada');
                          return;
                        }
                        print('Tenemos imagen ${pickedFile.path}');
                        productProvider.updateSelectedProductImage(pickedFile.path);
                    },
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
        child: productProvider.isSaving? CircularProgressIndicator(color: Colors.white,): Icon(Icons.save),
        onPressed: productProvider.isSaving?
        null:
        ()async{
          if(!formProvider.isValid()){return;}

          final String? imageUrl = await productProvider.uploadImage();
          if(imageUrl != null){
            formProvider.producto.picture = imageUrl;
            
          }
          

          await productProvider.saveOrCreateProduct(formProvider.producto);
          
        },
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
    final _dataProductProvider = Provider.of<ProductFormProvider>(context);
    final product = _dataProductProvider.producto;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _decorationForm(),
        child: Form(
          key: _dataProductProvider.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 10,),

              TextFormField(
                initialValue: product.name,
                onChanged: (value) => {
                  product.name = value
                },
                validator: (value){
                    if(value == null || value.length < 2){
                      return "El nombre el obligatorio";
                    }else{
                      return null;
                    }
                },
                decoration: InputDecorations.authInputDecoration(
                  icono: Icons.text_fields,
                  hint_text: 'nombre del producto',
                  label_text: 'Nombre:',                  
                  ),
              ),

              SizedBox(height: 30,),

              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                initialValue: product.price.toString(),
                onChanged: (value){
                  if(double.tryParse(value)==null){
                    product.price = 0;
                  }else{
                    product.price = double.parse(value);
                  }              
                
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  icono: Icons.price_check_sharp,
                  hint_text: '\$150',
                  label_text: 'Precio:'
                  ),
              ),
              SizedBox(height:30,),
              SwitchListTile(
                value: product.available,
                title: Text('Disponible'),
                activeColor: GlobalTheme.primary,
                onChanged: (value){
                  _dataProductProvider.updateAvailable(value);
                }
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
