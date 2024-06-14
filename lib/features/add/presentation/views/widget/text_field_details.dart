// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';

class TextFieldDetails extends StatefulWidget {
  const TextFieldDetails({Key? key, required this.controllerOfList})
      : super(key: key);

  @override
  _TextFieldDetailsState createState() => _TextFieldDetailsState();

  final TextEditingController controllerOfList;

  // Define the names list as a static variable
  static const List<String> names = [
    'balcony',
    'kitchen',
    'wifi',
    'naturalGas',
    'elevator',
    'privateGarden',
    'landLine',
    'parking',
    'conditioning',
    'electricityMeter',
    'waterMeter',
  ];
}

class _TextFieldDetailsState extends State<TextFieldDetails> {
  Map<String, bool> itemsMap = {};

  @override
  void initState() {
    super.initState();
    // Initialize the map with items from the names list
    for (var item in TextFieldDetails.names) {
      itemsMap[item] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chose details'),
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
            // child: TextField(
            //   controller: widget.controllerOfList,
            //   decoration: InputDecoration(
            //     suffixIcon: Icon(Icons.search),
            //   ),
            // ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: TextFieldDetails.names.length,
              itemBuilder: (context, index) {
                final item = TextFieldDetails.names[index];
                return ListTile(
                  title: Text(item),
                  trailing: Checkbox(
                    value: itemsMap[item] ?? false,
                    activeColor: kLogoColor,
                    onChanged: (value) {
                      setState(() {
                        itemsMap[item] = value ?? false;
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
          CustomButon(
            radius: 8,
            text: 'Confirm',
            onPressed: () {
              List<String> selectedItems = [];
              // Get the selected items from the map
              itemsMap.forEach((key, value) {
                if (value) {
                  selectedItems.add(key);
                }
              });
              widget.controllerOfList.text = selectedItems.join(',');
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
