import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SampleFlutterMap extends StatefulWidget {
  const SampleFlutterMap({Key? key}) : super(key: key);

  @override
  _SampleFlutterMapState createState() => _SampleFlutterMapState();
}

class _SampleFlutterMapState extends State<SampleFlutterMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Map'),),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(24.406581, 54.558394),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            /*attributionBuilder: (_) {
              return Text("© OpenStreetMap contributors");
            },*/
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(51.5, -0.09),
                builder: (ctx) =>
                    Container(
                      child: FlutterLogo(),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
