// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:sakkiny/features/services/data/repos/services_repo_impl.dart';
// import 'package:sakkiny/features/services/presentation/manger/cubit/cubit/recomendservice_state.dart';

// class RecommendedServiceCubit extends Cubit<RecommendedServiceStates> {
//   RecommendedServiceCubit() : super(InitialRecommendedServiceState());
//   static RecommendedServiceCubit get(context) => BlocProvider.of(context);

//   Map<int?, bool?> favorites = {};

//   Future<void> fetchRecommendedProperty() async {
//     emit(LoadingRecommendedServiceState());
//     var result = await ServiceRepoImpl().fetchRecommendedService();
//     result.fold((failure) {
//       emit(FailureRecommendedServiceState(failure.error));
//     }, (service) {
//       // for (var element in homeModel.data!.products!) {
//       //   favorites.addAll({element.id: element.inFavorites});
//       // }
//       emit(SuccessRecommendedServiceState(service));
//     });
//   }
// }
