import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);//expect a child widget, constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[ 300 ],
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _CustomBox(),
          _HeaderIcon(),
          this.child
        ],
      ),
      
    );
  }
}

class _HeaderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only( top: 30 ),
        child: Image.asset(
          'images/loginLogoWhite.png',
          width: 120,
          height: 120,
          )
        //Icon( Icons.person_pin, color: Colors.white, size: 120, )
        //login user icon
        
        //Image.asset('images/loginLogo.png')
      ),
    );
  }
}

class _CustomBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _customBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 170, left: 30 ),
          Positioned(child: _Bubble(), top: -10, left: 60 ),
          Positioned(child: _Bubble(), top: -50, right: -20 ),
          Positioned(child: _Bubble(), bottom: -50, left: 220 ),
          Positioned(child: _Bubble(), bottom: 120, right: 40 ),
        ],
      ),

    );
  }

  BoxDecoration _customBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(24, 85, 81, 80),
        Color.fromRGBO(51, 92, 103, 110)
      ]
    )
  );//extracted method
}

class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}