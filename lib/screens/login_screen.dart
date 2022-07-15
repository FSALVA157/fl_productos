import 'dart:ui';

import 'package:fl_productos/provider/login_form_provider.dart';
import 'package:fl_productos/themes/global_theme.dart';
import 'package:fl_productos/ui/input_decorations.dart';
import 'package:fl_productos/widgets/widget.dart';
import 'package:fl_productos/widgets/login_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: LoginBackground(
        child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                          children: [
                            SizedBox(height: 200),
                            CardContainer(
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Text('Login', style: Theme.of(context).textTheme.headline5,),
                                  SizedBox(height: 30,),
                                  ChangeNotifierProvider(
                                    create: (_) => LoginFormProvider(),
                                    child: _LoginForm(),
                                    )
                                  
                                ],
                              ),
                            ),
                            SizedBox(height: 50,),
                            Text('Crear una Nueva Cuenta', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height: 50,),
                          ],
                      ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginFormProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                icono: Icons.alternate_email_sharp,
                hint_text: 'john.doe@gmail.com',
                label_text: 'Correo Electronico'
                ),
                validator: (value){
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  return (regExp.hasMatch(value ?? ''))? null: "El email no es válido";
                },
                onChanged: (value){
                    loginFormProvider.email = value;
                },
            ),
            SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                icono: Icons.lock_outline,
                hint_text: '****',
                label_text: 'Password'
                ),
              validator: (value){
                return (value != null && value.length > 5)? null: "la contraseña no es válida";
              },
              onChanged: (value)=>loginFormProvider.password = value,
            ),
            SizedBox(height: 40,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.deepPurple,
              elevation: 0,
              disabledColor: Colors.grey,
              child: (loginFormProvider.isLoading)?
                          Text('Espere por favor', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                        :Text('Ingresar', style: TextStyle(color: Colors.white),),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              onPressed: (loginFormProvider.isLoading)? null
                  : ()async{
                    FocusScope.of(context).unfocus();
                    if(loginFormProvider.isValid()) {
                        loginFormProvider.isLoading = true;
                        await Future.delayed(Duration(seconds: 2));
                        Navigator.pushReplacementNamed(context, 'home');
                    }else{
                      return;
                    }
              })           
          ],
        )
        ),
    );
  }
}