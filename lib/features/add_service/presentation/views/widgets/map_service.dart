// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapServicePage extends StatefulWidget {
  const MapServicePage({super.key});

  @override
  _MapSearchPageState createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<MapServicePage> {
  late GoogleMapController _mapController;
  late TextEditingController searchController;
  String _searchText = '';
  final Set<Marker> _markers = {};
  late Map<String, dynamic> result = {};

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: const Text('Map Search'),
        //   centerTitle: true,
        // ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(31.20463, 29.91782), // Initial map center
                zoom: 15.0, // Initial map zoom level
              ),
              markers: _markers,
            ),
            Positioned(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search for a location...',
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchText = value;
                          });
                        },
                        onSubmitted: (value) {
                          _searchLocation();
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: _searchLocation,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _searchLocation() async {
    if (_searchText.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(_searchText);
        if (locations.isNotEmpty) {
          Location location = locations.first;
          LatLng latLng = LatLng(location.latitude, location.longitude);

          _mapController.animateCamera(CameraUpdate.newLatLng(latLng));
          result = {
            'city_name': searchController.text,
            'latLng': latLng,
          };

          setState(() {
            _markers.clear();
            _markers.add(
              Marker(
                markerId: MarkerId(_searchText),
                position: latLng,
                infoWindow: InfoWindow(
                  title: _searchText,
                ),
                onTap: () {
                  Navigator.pop(context, result); // Return the coordinates
                },
              ),
            );
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('No results found for the searched location.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error searching for location: $e')),
        );
      }
    }
  }
}
