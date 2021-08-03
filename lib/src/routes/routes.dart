import 'package:flutter/material.dart';
import 'package:dragame/src/pages/splash_page.dart';
import 'package:dragame/src/pages/home_page.dart';
import 'package:dragame/src/pages/level_one_page.dart';
import 'package:dragame/src/pages/score_page.dart';

Map <String, WidgetBuilder> getAppRoutes(){

  return <String, WidgetBuilder>{
         '/splash'       : ( BuildContext context ){ return Splash();},
         '/'             : ( BuildContext context ){ return HomePage();},
         '/level_one'    : ( BuildContext context ){ return LevelOne(); },
         '/score'        : ( BuildContext context ){ return Score(); }
          };
}