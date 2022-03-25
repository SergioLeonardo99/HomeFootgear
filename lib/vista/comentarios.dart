import 'package:flutter/material.dart';
import 'package:product_rain/temas/color.dart';

class ComentarioPagina extends StatefulWidget {
  

  @override
  _ComentarioPaginaState createState() => _ComentarioPaginaState();
}

class _ComentarioPaginaState extends State<ComentarioPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: Center(child: Text("Comentarios", style: TextStyle(color: black),),),
      
    );
  }
}