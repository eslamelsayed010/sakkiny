import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/favorite/data/repo/favorite_repo_impl.dart';
import 'package:sakkiny/features/favorite/presentation/manager/fav_cubit/fav_state.dart';


class FavCubit extends Cubit<FavStates> {
  FavCubit() : super(InitialFetchFavoriteState());
  static FavCubit get(context) => BlocProvider.of(context);

  Future<void> fetchFavItem() async {
    emit(LoadingFetchFavoriteState());
    var result = await FavoriteRepoImpl().fetchFavoriteItem();
    result.fold((failure) {
      emit(FailureFetchFavoriteState(failure.error));
    }, (favModel) {
      emit(SuccessFetchFavoriteState(favModel));
    });
  }
}
