import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wefind/models/youth_group.dart';
import 'package:wefind/widgets/youth_group_card.dart';

import '../dummy_data.dart';
import '../models/city.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();
  City lausanne = cities[0];
  List<YouthGroup> ygs = youthGroups;
  YouthGroup adoray = youthGroups[0];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
      // Add the markers of all the existing youth groups on the map
      markers.add(Marker(
        markerId: MarkerId(adoray.id.toString()),
        position: LatLng(adoray.lat, adoray.long),
        onTap: () {
          adoray.isVisible = !adoray.isVisible;
          print(adoray.isVisible);
        },
        infoWindow: InfoWindow(title: adoray.name, snippet: 'A nice yg')
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(lausanne.lat, lausanne.long),
            zoom: lausanne.zoom,
          ),
          markers: markers,
        ),
        adoray.isVisible
            ? YouthGroupCard(adoray)
            : const Text(
                'HELLO',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
      ],
    );
  }
}
