import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/favorite/data/repo/favorite_service_repo_impl.dart';
import 'package:sakkiny/features/favorite/presentation/manager/fav_service_cubit/fav_service_state.dart';


class FavServiceCubit extends Cubit<FavServiceStates> {
  FavServiceCubit() : super(InitialFetchFavoriteServiceState());
  static FavServiceCubit get(context) => BlocProvider.of(context);

  Future<void> fetchFavServiceItem() async {
    emit(LoadingFetchFavoriteServiceState());
    var result = await FavoriteServiceRepoImpl().fetchFavoriteServiceItem();
    result.fold((failure) {
      emit(FailureFetchFavoriteServiceState(failure.error));
    }, (favServiceModel) {
      emit(SuccessFetchFavoriteServiceState(favServiceModel));
    });
  }
}
