// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/bloc_observer/bloc_observer.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/cache_helper.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/service_locator.dart';
import 'package:sakkiny/core/utils/theme_data.dart';
import 'package:sakkiny/features/favorite/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/fav_service_cubit/fav_service_cubit.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';
import 'package:sakkiny/features/home/presentation/manger/recommended_cubit/recommended_cubit.dart';
import 'package:sakkiny/features/home/presentation/manger/user_cubit/user_cubit.dart';
import 'package:sakkiny/features/layout/manger/layout_cubit.dart';
import 'package:sakkiny/features/profile/presentation/manger/lang_cubit/lang_cubit.dart';
import 'package:sakkiny/features/profile/presentation/manger/lang_cubit/lang_states.dart';
import 'package:sakkiny/features/services/presentation/manger/cubit/service_cubit.dart';
import 'core/utils/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');
  debugPrint('token : $token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => PropertyCubit()..fetchProperty(),
        ),
        BlocProvider(
          create: (context) => RecommendedCubit()..fetchRecommendedProperty(),
        ),
        BlocProvider(
          create: (context) => ServiceCubit()..fetchService(),
        ),
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => FavCubit()..fetchFavItem(),
        ),
        BlocProvider(
          create: (context) => FavServiceCubit()..fetchFavServiceItem(),
        ),
        BlocProvider(
          create: (context) => UserCubit()..fetchUserInfo(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
          builder: (context, state) {
        return MaterialApp.router(
          locale: state.locale,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            for (var locale in supportedLocales) {
              if (deviceLocale != null &&
                  deviceLocale.languageCode == locale.languageCode) {
                return deviceLocale;
              }
            }
            return supportedLocales.first;
          },
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: buildThemeData(),
        );
      }),
    );
  }
}
