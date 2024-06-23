import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';

class WhoAreYouList extends StatefulWidget {
  const WhoAreYouList({super.key, required this.controller});

  @override
  WhoAreYouListState createState() => WhoAreYouListState();
  final TextEditingController controller;
}

class WhoAreYouListState extends State<WhoAreYouList> {
  List<String> types = [
    'owner',
    'broker',
    'real state company',
    'government agencies',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Are you : '.tr(context)),
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
