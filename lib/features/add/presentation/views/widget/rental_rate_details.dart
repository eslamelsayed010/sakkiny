import 'package:flutter/material.dart';

class RentalDetails extends StatefulWidget {
  const RentalDetails({super.key, required this.controller});

  @override
  RentalDetailsState createState() => RentalDetailsState();
  final TextEditingController controller;
}

class RentalDetailsState extends State<RentalDetails> {
  List<String> types = [
    'daily',
    'weekly',
    'monthly',
    'yearly',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose the rental rate'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // Close button action
            },
          ),
        ],
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
                  title: Text(types[index]),
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
