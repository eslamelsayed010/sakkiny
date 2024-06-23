import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';

class FloorDetails extends StatefulWidget {
  const FloorDetails({super.key, required this.fController});

  @override
  FloorDetailsState createState() => FloorDetailsState();
  final TextEditingController fController;
}

class FloorDetailsState extends State<FloorDetails> {
  List<String> floor = [
    'The ground',
    'The first',
    'The second',
    'The third',
    'The fourth',
    'Fifth',
    'Sixth',
    'Seventh',
    'Eighth',
    'Ninth',
    'The tenth',
    'the last',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose floor'.tr(context)),
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
                  title: Text(floor[index].tr(context)),
                  onTap: () {
                    setState(() {
                      widget.fController.text = floor[index];
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
