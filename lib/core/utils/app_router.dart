import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/features/add/presentation/views/add_view.dart';
import 'package:sakkiny/features/add/presentation/views/widget/add_property_view.dart';
import 'package:sakkiny/features/add/presentation/views/widget/add_service_view.dart';
import 'package:sakkiny/features/auth/sign_in/presentation/view/sign_in_view.dart';
import 'package:sakkiny/features/auth/sign_up/presentation/view/sign_up_view.dart';
import 'package:sakkiny/features/edit/presentation/views/edit_view.dart';
import 'package:sakkiny/features/edit/presentation/views/widget/edit_image_view.dart';
import 'package:sakkiny/features/edit/presentation/views/widget/edit_property_view.dart';
import 'package:sakkiny/features/favorite/presentation/views/favorite_view.dart';
import 'package:sakkiny/features/filter/presentation/views/filter_view.dart';
import 'package:sakkiny/features/get_start/get_start_view.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/presentation/views/widget/home_view_body.dart';
import 'package:sakkiny/features/layout/view/layout_view.dart';
import 'package:sakkiny/features/profile/presentation/views/profile_view.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/about_view.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/lang_body.dart';
import 'package:sakkiny/features/search/presentation/views/search_view.dart';
import 'package:sakkiny/features/search_services/presentation/views/search_services_view.dart';
import 'package:sakkiny/features/selected/presentation/views/selected_view.dart';
import 'package:sakkiny/features/selected_services/presentation/views/selected_services_view.dart';
import 'package:sakkiny/features/services/presentation/view/services_view.dart';
import 'package:sakkiny/features/splash/splash_view.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

abstract class AppRouter {
  static const kGetStartView = '/GetStartView';
  static const kSignInView = '/SignInView';
  static const kSignUpView = '/SignUpView';
  static const kLayoutView = '/LayoutView';
  static const kHomeView = '/HomeView';
  static const kServicesView = '/ServicesView';
  static const kAddView = '/AddView';
  static const kFavoriteView = '/FavoriteView';
  static const kProfileView = '/ProfileView';
  static const kSelectedView = '/SelectedView';
  static const kSearchView = '/SearchView';
  static const kFilterView = '/FilterView';
  static const kLangView = '/LangView';
  static const kAboutView = '/AboutView';
  static const kSearchServicesView = '/SearchServicesView';
  static const kSelectedServicesView = '/SelectedServicesView';
  static const kAddPropertyView = '/AddPropertyView';
  static const kAddServiceView = '/AddServiceView';
  static const kViewAllListView = '/ViewAllListView';
  static const kEditView = '/EditView';
  static const kEditPropertyView = '/EditPropertyView';
  static const kEditImageView = '/EditImageView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: '/GetStartView',
        builder: (BuildContext context, GoRouterState state) {
          return const GetStartView();
        },
      ),
      GoRoute(
        path: '/SignInView',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInView();
        },
      ),
      GoRoute(
        path: '/SignUpView',
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpView();
        },
      ),
      GoRoute(
        path: '/LayoutView',
        builder: (BuildContext context, GoRouterState state) {
          return const LayoutView();
        },
      ),
      GoRoute(
        path: '/HomeView',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeViewBody();
        },
      ),
      GoRoute(
        path: '/ServicesView',
        builder: (BuildContext context, GoRouterState state) {
          return const ServicesView();
        },
      ),
      GoRoute(
        path: '/AddView',
        builder: (BuildContext context, GoRouterState state) {
          return const AddView();
        },
      ),
      GoRoute(
        path: '/FavoriteView',
        builder: (BuildContext context, GoRouterState state) {
          return const FavoriteView();
        },
      ),
      GoRoute(
        path: '/ProfileView',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileView();
        },
      ),
      GoRoute(
        path: '/SelectedView',
        builder: (BuildContext context, GoRouterState state) {
          return SelectedView(
            property: state.extra as Property,
          );
        },
      ),
      GoRoute(
        path: '/SearchView',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
      GoRoute(
        path: '/FilterView',
        builder: (BuildContext context, GoRouterState state) {
          return const FilterView();
        },
      ),
      GoRoute(
        path: '/LangView',
        builder: (BuildContext context, GoRouterState state) {
          return const LangView();
        },
      ),
      GoRoute(
        path: '/AboutView',
        builder: (BuildContext context, GoRouterState state) {
          return const AboutView();
        },
      ),
      GoRoute(
        path: '/SearchServicesView',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchServicesView();
        },
      ),
      GoRoute(
        path: '/SelectedServicesView',
        builder: (BuildContext context, GoRouterState state) {
          return SelectedServicesView(service: state.extra as Service);
        },
      ),
      GoRoute(
        path: '/AddPropertyView',
        builder: (BuildContext context, GoRouterState state) {
          return const AddPropertyView();
        },
      ),
      GoRoute(
        path: '/AddServiceView',
        builder: (BuildContext context, GoRouterState state) {
          return const AddServiceView();
        },
      ),
      // GoRoute(
      //   path: '/ViewAllListView',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const ViewAllListView();
      //   },
      // ),
      GoRoute(
        path: '/EditView',
        builder: (BuildContext context, GoRouterState state) {
          return const EditView();
        },
      ),
      GoRoute(
        path: '/EditPropertyView',
        builder: (BuildContext context, GoRouterState state) {
          return const EditPropertyView();
        },
      ),
      GoRoute(
        path: '/EditImageView',
        builder: (BuildContext context, GoRouterState state) {
          return const EditImageView();
        },
      ),
    ],
  );
}
