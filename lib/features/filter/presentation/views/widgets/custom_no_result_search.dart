import 'package:flutter/material.dart';

class CustomNoResult extends StatelessWidget {
  const CustomNoResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .3),
          child: const Center(
            child: Text(
              'No Result',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
