import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/favorite/data/repo/favorite_repo_impl.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_cubit/change_favorite_state.dart';
import 'package:sakkiny/features/favorite/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:sakkiny/features/home/data/models/home_model/home_model.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';


class ChangeFavoriteCubit extends Cubit<ChangeFavoriteState> {
  ChangeFavoriteCubit() : super(InitialChangeFavoriteState());
  static ChangeFavoriteCubit get(context) => BlocProvider.of(context);

  HomeModel? changeFavoriteModelCubit;
  Future<void> changeFavoriteItem({required String id, context}) async {
    PropertyCubit.get(context).favorites[id] =
        !PropertyCubit.get(context).favorites[id]!;
    emit(ChangeColorFavoriteState());
    var result = await FavoriteRepoImpl().changeFavoriteItem(id: id);
    result.fold((failure) {
      FavCubit.get(context).fetchFavItem();
      emit(FailureChangeFavoriteState(failure.error));
    }, (changeFavoriteModel) {
      emit(SuccessChangeFavoriteState(changeFavoriteModel));
      FavCubit.get(context).fetchFavItem();
      changeFavoriteModelCubit = changeFavoriteModel;
      if (!changeFavoriteModelCubit!.status!) {
        PropertyCubit.get(context).favorites[id] =
            !PropertyCubit.get(context).favorites[id]!;
      }
      debugPrint(changeFavoriteModel.message);
    });
  }
}
