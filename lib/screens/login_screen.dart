import 'package:fl_productos/themes/global_theme.dart';
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
                                  SizedBox(height: 30,)
                                ],
                              ),
                            )
                          ],
                      ),
        ),
      ),
    );
  }
}