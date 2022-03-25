import 'package:flutter/material.dart';
import 'package:product_rain/temas/color.dart';

class PerfilPagina extends StatefulWidget {
  const PerfilPagina({ Key? key }) : super(key: key);

  @override
  _PerfilPaginaState createState() => _PerfilPaginaState();
}

class _PerfilPaginaState extends State<PerfilPagina> {
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      backgroundColor: lightGrey,
      body: Center(child: Text("Perfiles", style: TextStyle(color: black),),),
      
    );
  }
}