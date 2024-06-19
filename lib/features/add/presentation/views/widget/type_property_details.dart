import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';

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
        title:  Text('Choose Type'.tr(context)),
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
