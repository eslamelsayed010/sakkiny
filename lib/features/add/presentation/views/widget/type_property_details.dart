import 'package:flutter/material.dart';

class TypeDetails extends StatefulWidget {
  const TypeDetails({super.key, required this.controller});

  @override
  TypeDetailsState createState() => TypeDetailsState();
  final TextEditingController controller;
}

class TypeDetailsState extends State<TypeDetails> {
  List<String> types = [
    'apartment',
    'duplex',
    'room',
    'studio',
    'shop',
    'villa',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Type'),
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
