import 'dart:async';

import 'package:barberapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps',
      home: MapSample(
        service: '',
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  String service;
  MapSample({required this.service});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.250022, 103.248015),
    zoom: 14.4746,
  );

  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'ร้านตัดผม'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(16.250022, 103.248015),
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(16.250022, 103.248015),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.hybrid,
            markers: {
              _kGooglePlexMarker,
            },
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            bottom: 20, // ปรับค่าตำแหน่งตามที่ต้องการ
            right: 150, // ปรับค่าตำแหน่งตามที่ต้องการ
            child: FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: const Text('ร้านตัดผม',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              icon: const Icon(Icons.home_sharp,
              color: Color.fromARGB(255, 2, 43, 77),),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
