import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/bloc_observer/bloc_observer.dart';
import 'package:sakkiny/core/utils/cache_helper.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/service_locator.dart';
import 'package:sakkiny/core/utils/theme_data.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';
import 'package:sakkiny/features/home/presentation/manger/recommended_cubit/recommended_cubit.dart';
import 'package:sakkiny/features/layout/manger/layout_cubit.dart';
import 'core/utils/app_router.dart';

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
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: buildThemeData(),
      ),
    );
  }
}
