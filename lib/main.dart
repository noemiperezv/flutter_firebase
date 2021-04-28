import 'package:flutter/material.dart';
import 'package:flutter_vocacion/src/pages/carrera_page.dart';
import 'package:flutter_vocacion/src/pages/home_page.dart';
import 'package:flutter_vocacion/src/pages/info_page.dart';
import 'package:flutter_vocacion/src/pages/scroll_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'scroll',
        routes: {
          'home'  : ( BuildContext context ) => HomePage(),
          'carrera': ( BuildContext context ) => CarreraPage(),
          'info': (BuildContext context) => InfoPage(),
          'scroll':(BuildContext context) => ScrollPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.red[600],
        ),
      );
    
      
  }

  

}