import 'dart:ui';

import 'package:fl_productos/themes/global_theme.dart';
import 'package:fl_productos/ui/input_decorations.dart';
import 'package:fl_productos/widgets/widget.dart';
import 'package:fl_productos/widgets/login_background.dart';
import 'package:flutter/material.dart';

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
                                  _LoginForm()
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
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                icono: Icons.alternate_email_sharp,
                hint_text: 'john.doe@gmail.com',
                label_text: 'Correo Electronico'
                )
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
                )
            ),
            SizedBox(height: 40,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.deepPurple,
              elevation: 0,
              disabledColor: Colors.grey,
              child: Text('Ingresar', style: TextStyle(color: Colors.white),),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              onPressed: (){

              })           
          ],
        )
        ),
    );
  }
}