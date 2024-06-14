import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/layout/manger/layout_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.layoutCubit});
  final LayoutCubit layoutCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: kLogoColor,
          currentIndex: layoutCubit.currentIndex,
          unselectedItemColor: Colors.grey,
          items: layoutCubit.listItemIcons,
          onTap: (index) {
            layoutCubit.changeBottom(index);
          },
        ),
      ),
    );
  }
}
