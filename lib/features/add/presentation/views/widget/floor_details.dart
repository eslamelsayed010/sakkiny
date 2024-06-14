import 'package:flutter/material.dart';

class FloorDetails extends StatefulWidget {
  const FloorDetails({super.key, required this.fController});

  @override
  FloorDetailsState createState() => FloorDetailsState();
  final TextEditingController fController;
}

class FloorDetailsState extends State<FloorDetails> {
  List<String> floor = [
    'The ground',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'the last',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose floor'),
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
              itemCount: floor.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(floor[index]),
                  onTap: () {
                    setState(() {
                      widget.fController.text = floor[index].toString();
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
