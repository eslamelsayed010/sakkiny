// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';

class MapSearchPage extends StatefulWidget {
  const MapSearchPage({super.key});

  @override
  State<MapSearchPage> createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<MapSearchPage> {
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
                        decoration: InputDecoration(
                          hintText: 'Search for a location...'.tr(context),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchText = value;
                          });
                        },
                        onSubmitted: (value) {
                          _searchLocation();
                          showToast(
                            txt: 'Click on the red mark.'.tr(context),
                            state: ToastState.SUCCESS,
                          );
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        _searchLocation();
                        showToast(
                          txt: 'Click on the red mark.'.tr(context),
                          state: ToastState.SUCCESS,
                        );
                      },
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
          showToast(
            txt: 'No results found for the searched location.'.tr(context),
            state: ToastState.WARRING,
          );
        }
      } catch (e) {
        showToast(
          txt: 'Error searching for location:'.tr(context) + e.toString(),
          state: ToastState.WARRING,
        );
      }
    }
  }
}
