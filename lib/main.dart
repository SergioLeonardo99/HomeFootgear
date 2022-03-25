import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:product_rain/vista/inicio.dart';
import 'package:product_rain/vista/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
    // home:paginaInicio(),
      title: 'Shoes-Jhon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: Screen_inicial(),
      
    );
  }
}

class Screen_inicial extends StatefulWidget {
 
  @override
  _Screen_inicialState createState() => _Screen_inicialState();
}
class _Screen_inicialState extends State<Screen_inicial> {

  @override
  void initState() {
    Timer(
      Duration(
        seconds: 3,

      ),(){

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>login(),
        ));
    }

    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset('assets/logo.png')),
      ),
      
    );
  }
}
