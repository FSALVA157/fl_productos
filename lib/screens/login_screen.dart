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
                            SizedBox(height: 20,),
                            Text('Crear una Nueva Cuenta', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
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
                icono: Icon(Icons.alternate_email_sharp,
                color: Colors.deepPurple,),
                hint_text: 'john.doe@gmail.com',
                label_text: 'Correo Electronico'
                )
            )
          ],
        )
        ),
    );
  }
}