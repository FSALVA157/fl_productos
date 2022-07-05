import 'package:flutter/material.dart';


class LoginBackground extends StatelessWidget {
  final Widget child;
   
  const LoginBackground({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBackground(),
          _IconLogin(),
          this.child
        ],
      ),
    ),
    );
  }
}

class _IconLogin extends StatelessWidget {
  const _IconLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
      )
      );
  }
}

class _PurpleBackground extends StatelessWidget {
  const _PurpleBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      //color: Colors.deepPurple[800],
      decoration: _PurpleDecoration(),
      child: Stack(
        children: const [
          Positioned(left: 30,top: 50,child: _Bubble()),
          Positioned(left: -30,top: -40,child: _Bubble()),
          Positioned(right: -20,top: -50,child: _Bubble()),
          Positioned(left: 10,bottom: -50,child: _Bubble()),
          Positioned(right: 20,bottom: 120,child: _Bubble()),
           ],
      ),
    );
  }

  BoxDecoration _PurpleDecoration() => const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
		    Color.fromRGBO(90, 70, 178, 0.7)
        ]
    )
  );
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
      
      
    );
  }
}