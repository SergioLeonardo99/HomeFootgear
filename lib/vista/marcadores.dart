import 'package:latlong2/latlong.dart';

class MapMarcar{
  const MapMarcar({

    required this.image,
    required this.titulo,
    required this.direccion,
    required this.localisacion,
  });
  
  final String image;
  final String titulo;
  final String direccion;
  final LatLng  localisacion;
}

final _location = [
  LatLng(5.306667, -73.812458),
  LatLng(5.310474, -73.810261),

];

const _path = 'assets/images/';

final mapMarcar = [
  MapMarcar(
    image: '${_path}z.png',
    titulo: 'Zapateria Jhons',
    direccion: '3225622634',
    localisacion: _location[1],
  ),
];