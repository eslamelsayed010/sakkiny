import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/favorite/presentation/views/favorite_view.dart';
import 'package:sakkiny/features/home/presentation/views/home_view.dart';
import 'package:sakkiny/features/profile/presentation/views/profile_view.dart';
import 'package:sakkiny/features/services/presentation/view/services_view.dart';
import '../../add/presentation/views/add_view.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialLayoutState());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomViewsBody = const [
    HomeView(),
    ServicesView(),
    AddView(),
    FavoriteView(),
    ProfileView(),
  ];

  List<BottomNavigationBarItem> listItemIcons = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: 'Home',
      backgroundColor: kLogoColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.bolt),
      label: 'Services',
      backgroundColor: kLogoColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.circlePlus,
        size: 30,
      ),
      label: 'Add',
      backgroundColor: kLogoColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border_outlined),
      label: 'Favorite',
      backgroundColor: kLogoColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.user),
      label: 'Profile',
      backgroundColor: kLogoColor,
    ),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavLayoutState());
  }
}
