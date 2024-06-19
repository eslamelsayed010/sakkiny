import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';

class BathroomsDetails extends StatefulWidget {
  const BathroomsDetails({super.key, required this.bController});

  @override
  BathroomsDetailsState createState() => BathroomsDetailsState();
  final TextEditingController bController;
}

class BathroomsDetailsState extends State<BathroomsDetails> {
  List<int> bathrooms = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose number of bathrooms'.tr(context)),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: bathrooms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bathrooms[index].toString()),
                  onTap: () {
                    setState(() {
                      widget.bController.text = bathrooms[index].toString();
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
