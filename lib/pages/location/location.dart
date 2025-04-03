// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../widgets/bottom_nav_bar.dart';

void main() {
  runApp(Location());
}

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VeterinaryLocationPage(),
    );
  }
}

class VeterinaryLocationPage extends StatefulWidget {
  @override
  _VeterinaryLocationPageState createState() => _VeterinaryLocationPageState();
}

class _VeterinaryLocationPageState extends State<VeterinaryLocationPage> {
  final LatLng _center = LatLng(6.9271, 79.8612); // Example location
  final MapController _mapController = MapController();

  final List<Marker> _markers = [
    Marker(
      point: LatLng(6.9275, 79.8625),
      width: 80,
      height: 80,
      child: Icon(Icons.pets, color: Colors.blue, size: 40),
    ),
    Marker(
      point: LatLng(6.9260, 79.8600),
      width: 80,
      height: 80,
      child: Icon(Icons.pets, color: Colors.red, size: 40),
    ),
    Marker(
      point: LatLng(6.9280, 79.8630),
      width: 80,
      height: 80,
      child: Icon(Icons.pets, color: Colors.yellow, size: 40),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC4B177),
        title: Text("Welcome Samadhi!"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xFFC4B177)),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _center,
              initialZoom: 14.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(markers: _markers),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bella - Border Collie",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 18, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("1.2 km away from you"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(width: 8),
                      Icon(Icons.pets, color: Color(0xFFC4B177)),
                      SizedBox(width: 8),
                      Icon(Icons.warning, color: Colors.red),
                    ],
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC4B177)),
                    onPressed: () {},
                    child: Text("See More"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}