import 'package:flutter/material.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key, required this.controller});

  @override
  RentalDetailsState createState() => RentalDetailsState();
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
        title: Text('اختر معدل الايجار'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // Close button action
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: types.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(types[index]),
                  onTap: () {
                    setState(() {
                      widget.controller.text = types[index].toString();
                      Navigator.pop(context);
                    });
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
