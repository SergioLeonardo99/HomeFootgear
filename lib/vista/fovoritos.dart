import 'package:flutter/material.dart';
import 'package:product_rain/temas/color.dart';

class FavoritoPagina extends StatefulWidget {


  @override
  _FavoritoPaginaState createState() => _FavoritoPaginaState();
}

class _FavoritoPaginaState extends State<FavoritoPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: Center(child: Text("Zapatos_Favoritos", style: TextStyle(color: black),),),
      
    );
  }
}