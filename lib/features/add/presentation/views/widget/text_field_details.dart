import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';

class TextFieldDetails extends StatefulWidget {
  const TextFieldDetails({Key? key, required this.controllerOfList})
      : super(key: key);

  @override
  State<TextFieldDetails> createState() => _TextFieldDetailsState();

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
        title: Text('Chose luxuries'.tr(context)),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: TextFieldDetails.names.length,
              itemBuilder: (context, index) {
                final item = TextFieldDetails.names[index];
                return ListTile(
                  title: Text(item.tr(context)),
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
            text: 'Confirm'.tr(context),
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
