import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key, required this.controller});

  @override
  State<ServiceDetails> createState() => RentalDetailsState();
  final TextEditingController controller;
}

class RentalDetailsState extends State<ServiceDetails> {
  List<String> types = [
    'plumbing',
    'electrical',
    'painting',
    'carpentry',
    'cleaning',
    'cooking',
    'appliances',
    'delivering',
    'guarding',
    'nursing',
    'interior design',
    'nannies',
    'dry cleaning',
    'security'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Service Type'.tr(context)),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: types.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(types[index].tr(context)),
                  onTap: () {
                    setState(() {
                      widget.controller.text = types[index].toString();
                      Navigator.pop(context);
                    });
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
