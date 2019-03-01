import 'package:flutter/material.dart';
import 'package:random_number/app/app.dart';
import 'package:random_number/screen/splash_screen.dart';

//void main() {
//runApp( MaterialApp(
//  home: MyApp(),
//));
//}

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new MyApp()
    },
  ));
}