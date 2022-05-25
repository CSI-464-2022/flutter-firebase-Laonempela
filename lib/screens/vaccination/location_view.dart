import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final Marker _kBokamoso = Marker(
    markerId: MarkerId('_kBokamoso'),
    infoWindow: InfoWindow(title: 'Lenmed Bokamoso Clinic'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(-24.54842, 25.83984),
  );
  static final Marker _kAcademic = Marker(
    markerId: MarkerId('_kAcademic'),
    infoWindow: InfoWindow(title: 'Francistown Academic Hospital'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(-21.23340, 27.49347),
  );
  static final Marker _kSide = Marker(
    markerId: MarkerId('_kSide'),
    infoWindow: InfoWindow(title: 'Riverside Hospital'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(-21.16161, 27.51285)
  );

  static final Marker _kLife = Marker(
    markerId: MarkerId('_kLife'),
    infoWindow: InfoWindow(title: 'Life Gaborone Hospital'),
    icon: BitmapDescriptor.defaultMarker,
    position:LatLng(-24.62798, 25.93361),
  );

  static final Marker _kUni= Marker(
    markerId: MarkerId('_kUni'),
    infoWindow: InfoWindow(title: 'University of Botswana'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(-24.66030, 25.93084),
  );
  static final Marker _kMaun = Marker(
    markerId: MarkerId('_kMaun'),
    infoWindow: InfoWindow(title: 'Maun Genaral hospital'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(-20.00676445609749, 23.415550655907925),
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        markers: {_kBokamoso,_kUni,_kMaun,_kLife,_kAcademic,_kSide},
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
