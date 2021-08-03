import 'package:dragame/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'PressStart'),
    //definicion de las rutas
    initialRoute: '/splash',
    routes: getAppRoutes(), //get rutas
  ));
}
