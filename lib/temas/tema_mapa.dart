import 'package:flutter/material.dart';
import 'package:product_rain/vista/mapsbox.dart';

class MainMapa extends StatelessWidget {
  const MainMapa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: MapaAnimado(),
    );
    
  }
}