// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapSearchPage extends StatefulWidget {
//   @override
//   _MapSearchPageState createState() => _MapSearchPageState();
// }

// class _MapSearchPageState extends State<MapSearchPage> {
//   late GoogleMapController _mapController;
//   late TextEditingController _searchController;
//   String _searchText = '';
//   Set<Marker> _markers = {};

//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map Search'),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(31.20463, 29.91782), // Initial map center
//               zoom: 15.0, // Initial map zoom level
//             ),
//             markers: _markers,
//           ),
//           Positioned(
//             top: 16.0,
//             left: 16.0,
//             right: 16.0,
//             child: Container(
//               color: Colors.white,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         hintText: 'Search for a location...',
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//                         border: InputBorder.none,
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _searchText = value;
//                         });
//                       },
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.search),
//                     onPressed: _searchLocation,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _mapController = controller;
//     });
//   }
// p
//   void _searchLocation() async {
//     if (_searchText.isNotEmpty) {
//       try {
//         List<Location> locations = await locationFromAddress(_searchText);
//         if (locations.isNotEmpty) {
//           Location location = locations.first;
//           LatLng latLng = LatLng(location.latitude, location.longitude);

//           _mapController.animateCamera(CameraUpdate.newLatLng(latLng));

//           _markers.clear();
//           _markers.add(
//             Marker(
//               markerId: MarkerId(_searchText),
//               position: latLng,
//               infoWindow: InfoWindow(
//                 title: _searchText,
//               ),
//               onTap: () {
//                 Navigator.pop(context, latLng); // Return the coordinates
//               },
//             ),
//           );

// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

//           setState(() {});
//         } else {
//           print('No results found for the searched location.');
//         }
//       } catch (e) {
//         print('Error searching for location: $e');
//       }
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSearchPage extends StatefulWidget {
  const MapSearchPage({super.key});

  @override
  _MapSearchPageState createState() => _MapSearchPageState();
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
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
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
