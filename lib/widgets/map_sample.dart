import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();
  double latLausanne = 46.518708;
  double longLausanne = 6.6097896;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: TextField(
      //     onSubmitted: (val) {
      //       print(val);
      //       lat = -22.7;
      //       long = -48.07;
      //       LatLng position = LatLng(lat, long);
      //       mapController.moveCamera(CameraUpdate.newLatLng(position));

      //       final Marker marker = Marker(
      //         markerId: MarkerId('123456'),
      //         position: position,
      //         infoWindow: InfoWindow(
      //           title: 'Casa do balta',
      //           snippet: 'Piracicapa/SP',
      //         ),
      //       );
      //       setState(() {
      //         markers.add(marker);
      //       });
      //     },
      //   ),
      // ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: (data) {
            print(data);
          },
          onTap: (position) {
            print(position);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(latLausanne, longLausanne),
            zoom: 12.97,
          ),
          markers: markers,
        ),
      ),
    );
  }
}
