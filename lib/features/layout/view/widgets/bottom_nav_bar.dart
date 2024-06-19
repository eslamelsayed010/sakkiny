import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/layout/manger/layout_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.layoutCubit});
  final LayoutCubit layoutCubit;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> listItemIcons = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home_filled),
        label: 'Home'.tr(context),
        backgroundColor: kLogoColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(FontAwesomeIcons.bolt),
        label: 'Services'.tr(context),
        backgroundColor: kLogoColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          FontAwesomeIcons.circlePlus,
          size: 30,
        ),
        label: 'Add'.tr(context),
        backgroundColor: kLogoColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite_border_outlined),
        label: 'Favorite'.tr(context),
        backgroundColor: kLogoColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(FontAwesomeIcons.user),
        label: 'Profile'.tr(context),
        backgroundColor: kLogoColor,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: kLogoColor,
          currentIndex: layoutCubit.currentIndex,
          unselectedItemColor: Colors.grey,
          items: listItemIcons,
          onTap: (index) {
            layoutCubit.changeBottom(index);
          },
        ),
      ),
    );
  }
}
