import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_finder_mvvm/models/place.dart';
import 'package:place_finder_mvvm/view_models/place_list_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GoogleMapController _controller;
  late Position _currentPosition;

  void _onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 14,
          target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        ),
      ),
    );
  }

  Set<Marker> _getNearbyMarkers(List<Place> places) {
    return places
        .map((place) => Marker(
              markerId: MarkerId(place.placeId),
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: InfoWindow(title: place.name),
              position: LatLng(place.lat, place.long),
            ))
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PlaceListViewModel>();
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: _getNearbyMarkers(vm.places),
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(26.238947, 73.024307),
              zoom: 14,
            ),
          ),
          SafeArea(
            child: TextField(
              onSubmitted: (value) {
                vm.fetchPlacesByKeywordAndPosition(
                  keyword: value,
                  lat: _currentPosition.latitude,
                  long: _currentPosition.longitude,
                );
              },
              decoration: const InputDecoration(
                label: Text('Search here...'),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
