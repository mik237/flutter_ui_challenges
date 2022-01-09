import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapSample extends StatefulWidget {
  const FlutterMapSample({Key? key}) : super(key: key);

  @override
  _FlutterMapSampleState createState() => _FlutterMapSampleState();
}

class _FlutterMapSampleState extends State<FlutterMapSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              onTap: (p) async {

              },
              center: LatLng(49.5, -0.09),
              zoom: 10.0,
            ),
            /*layers: [
            TileLayerOptions(
                urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: point,
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ],*/
          ),
        ],
      ),
    );
  }
}
