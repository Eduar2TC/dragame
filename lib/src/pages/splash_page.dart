import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dragame/src/pages/home_page.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState(){
    return new _SplashState();
  }
  
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 25.5, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 60, 60, 60)
          ),
          children: <TextSpan>[
            TextSpan(text: 'Dra'),
            TextSpan(text: 'game', style: TextStyle(fontSize: 25.5, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 5, 128, 181)))
          ],
        ),
      ),
      loadingText: Text("Cargando..."),
      seconds: 3,
      navigateAfterSeconds: HomePage(),
      image: Image.asset('assets/img/splash/splash_00.png'),
      photoSize: 225,
      loaderColor: Colors.green,
      );
  }
}