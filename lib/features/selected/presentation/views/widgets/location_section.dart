import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({Key? key, required this.property}) : super(key: key);
  final Property property;
  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  var marker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.location_on),
            Text(
              widget.property.address!,
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
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.property.latitude!.toDouble(),
                  widget.property.longitude!.toDouble(),
                ), // => lat long of Zagazig, Sharqia Governorate
                zoom: 12.0,
              ),
              markers: marker,
              onMapCreated: (controller) {
                setState(() {
                  marker.add(
                    Marker(
                      markerId: const MarkerId('1'),
                      position: LatLng(
                        widget.property.latitude!.toDouble(),
                        widget.property.longitude!.toDouble(),
                      ),
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
