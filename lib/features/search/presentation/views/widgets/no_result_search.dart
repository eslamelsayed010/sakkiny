import 'package:flutter/material.dart';

class NoResultSearch extends StatelessWidget {
  const NoResultSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'Search For Show Property',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
