import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:product_rain/vista/marcadores.dart';

const MAPBOX_ACCES_TOKEN =
  'pk.eyJ1IjoibGVvbmFyZDk5IiwiYSI6ImNsMzIwY2Z1NzBleXQzam93ODF2aGZzbWMifQ.rKzp2JUQ5keBVEpxA9WzZQ';
const MAPBOX_STYLE = 'mapbox/dark-v10';
const MARKER_COLOR = Color.fromARGB(255, 61, 165, 197);

final _myLocation = LatLng(5.306643, -73.812466);

class MapaAnimado extends StatefulWidget {
  const MapaAnimado({Key? key}) : super(key: key);

  @override
  State<MapaAnimado> createState() => _MapaAnimadoState();
}

class _MapaAnimadoState extends State<MapaAnimado> {

  final _paginaControlador = PageController();





  List<Marker> _buildMarkers(){
    final _marcarLista = <Marker> [];
    for (int i=0; i<mapMarcar.length;i++){
      final mapItem = mapMarcar[i];
      _marcarLista.add(
        Marker(
          height: 40,
          width: 40,
          point: mapItem.localisacion,
          builder: (_){
        return GestureDetector(
          onTap: () {
            print('Selected: ${mapItem.titulo}');
          },
          child: Image.asset('assets/images/location.png'),
        );
      },),);
    }
    return _marcarLista;

  }

  @override
  Widget build(BuildContext context) {
    final _Marcadores = _buildMarkers();
    return Scaffold(
      appBar: AppBar(
        title: Text('MapsBox'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () => null,
          )
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: _myLocation,
            ),
           nonRotatedLayers: [
            TileLayerOptions(
              urlTemplate: "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
              additionalOptions: {
                  'accessToken': MAPBOX_ACCES_TOKEN,
                  'id': MAPBOX_STYLE,
                },
            ),
            MarkerLayerOptions(
              markers: _Marcadores,
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  point: _myLocation,
                  builder: (_) {
                    return MyLocalizacionMarcada();
                  }
                ),
              ],
            ),
           ],
          ),
          // AAgregar una pagina de vista
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              itemBuilder: (context, index ){
                final item = mapMarcar[0];
                return _MapDetalles(
                  mapMarcar: item,
                );
            },
            ),
          ),
        ],
      ),
    );
    
  }
}

class MyLocalizacionMarcada extends StatelessWidget {
  const MyLocalizacionMarcada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
     return Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: MARKER_COLOR,
                        shape: BoxShape.circle,
                      ),

                    );
    
  }
}

class _MapDetalles extends StatelessWidget {
  const _MapDetalles({
    Key? key,
     required this.mapMarcar,
     }) : super(key: key);
     
     final MapMarcar mapMarcar;

  @override
  Widget build(BuildContext context) {
    final _styletitulo = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
    final _stylecontacto = TextStyle(color: Colors.grey[800], fontSize: 20);


    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Image.asset(mapMarcar.image),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mapMarcar.titulo,
                     style: _styletitulo,
                     
                  ),
                  const SizedBox(height: 10),
                  Text(
                    mapMarcar.direccion,
                     style: _stylecontacto,
                     
                    ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
    

  }
}