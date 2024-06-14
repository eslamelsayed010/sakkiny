import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/home/data/repos/home_repo_impl.dart';
import 'package:sakkiny/features/home/presentation/manger/recommended_cubit/recommended_states.dart';

class RecommendedCubit extends Cubit<RecommendedStates> {
  RecommendedCubit() : super(InitialRecommendedState());
  static RecommendedCubit get(context) => BlocProvider.of(context);

  Map<int?, bool?> favorites = {};

  Future<void> fetchRecommendedProperty() async {
    emit(LoadingRecommendedState());
    var result = await HomeRepoImpl().fetchRecommendedProperty();
    result.fold((failure) {
      emit(FailureRecommendedState(failure.error));
    }, (properties) {
      // for (var element in homeModel.data!.products!) {
      //   favorites.addAll({element.id: element.inFavorites});
      // }
      emit(SuccessRecommendedState(properties));
    });
  }
}
