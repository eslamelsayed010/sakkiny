import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';
class LocationServiceSection extends StatefulWidget {
  const LocationServiceSection({Key? key, required this.service}) : super(key: key);
  final Service service;
  @override
  State<LocationServiceSection> createState() => _LocationServiceSectionState();
}

class _LocationServiceSectionState extends State<LocationServiceSection> {
  var marker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.location_on),
            Text(
              widget.service.address!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GoogleMap(
              initialCameraPosition:  CameraPosition(
                target: LatLng(
                widget.service.location?.latitude?.toDouble() ?? 0.0,
    widget.service.location?.longitude?.toDouble() ?? 0.0,
               
                ), // => lat long of Zagazig, Sharqia Governorate
                zoom: 12.0,
              ),
              markers: marker,
              onMapCreated: (controller) {
                setState(() {
                  marker.add(
                    const Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(30.5876, 31.5020),
                    ),
                  );
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
