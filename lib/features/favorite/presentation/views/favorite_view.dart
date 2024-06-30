import 'package:flutter/material.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/custom_genres.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  const [
        Flexible(
          flex: 1,
          child: CustomGenres(),
        ),
      ],
    );
  }
}
