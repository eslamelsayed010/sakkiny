import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/desc_services_section.dart';
import 'dart:collection';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class LocationServiceSection extends StatefulWidget {
  const LocationServiceSection({Key? key, required this.service})
      : super(key: key);
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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.location_on),
            Text(
              widget.service.address!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              widget.service.serviceCategory!.tr(context),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DescServicesSection(
                          service: widget.service,
                        )
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.info_outline),
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
                  widget.service.latitude?.toDouble() ?? 0.0,
                  widget.service.longitude?.toDouble() ?? 0.0,
                ), // => lat long of Zagazig, Sharqia Governorate
                zoom: 12.0,
              ),
              markers: marker,
              onMapCreated: (controller) {
                setState(() {
                  marker.add(
                    Marker(
                      markerId: const MarkerId('1'),
                      position: LatLng(widget.service.latitude!.toDouble(),
                          widget.service.longitude!.toDouble()),
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
