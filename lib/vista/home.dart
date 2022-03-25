import 'dart:ui';

import 'package:flutter/material.dart';
class inicioScreen extends StatefulWidget {
  const inicioScreen({ Key? key }) : super(key: key);

  @override
  _inicioScreenState createState() => _inicioScreenState();
}

class _inicioScreenState extends State<inicioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hola bienvendido"), centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150,
              child: Image.asset("assets/logo.png", fit: BoxFit.contain),
              ),

              Text("Vuelve pronto",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              SizedBox(
                height: 10,
              ),
              Text("Nombre:",
               style: TextStyle(
                 color: Colors.black54,
                  fontWeight: FontWeight.w500
                  )),
                
              Text("Email",
               style: TextStyle(
                 color: Colors.black54,
                  fontWeight: FontWeight.w500
                  )),
                  SizedBox(
                    height: 15,
                  ),

                  ActionChip(label: Text("Salir"), onPressed: (){}),
            ],
          ),
        ),
      ),
      
    );
  }
}