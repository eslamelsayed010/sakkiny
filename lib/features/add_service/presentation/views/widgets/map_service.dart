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
  late TextEditingController _searchController;
  String _searchText = '';
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Search'),
      ),
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
                      controller: _searchController,
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
                  Navigator.pop(context, latLng); // Return the coordinates
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
