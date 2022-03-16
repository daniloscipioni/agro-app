import 'package:flutter/material.dart';
import 'package:bavaresco/screens/lista/maquina.dart';

class Splash extends StatefulWidget {
  //const Splash({ Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }

void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ListaMaquinas()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/bavaresco.png'),
      ),
      backgroundColor: Colors.white,

    );
  }
}

