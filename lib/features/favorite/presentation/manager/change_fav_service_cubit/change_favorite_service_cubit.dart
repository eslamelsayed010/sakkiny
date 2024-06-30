import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/favorite/data/repo/favorite_service_repo_impl.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_service_cubit/change_favorite_service_state.dart';
import 'package:sakkiny/features/favorite/presentation/manager/fav_service_cubit/fav_service_cubit.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/get_service_model.dart';
import 'package:sakkiny/features/services/presentation/manger/cubit/service_cubit.dart';

class ChangeFavoriteServiceCubit extends Cubit<ChangeFavoriteServiceState> {
  ChangeFavoriteServiceCubit() : super(InitialChangeFavoriteServiceState());
  static ChangeFavoriteServiceCubit get(context) => BlocProvider.of(context);

  GetServiceModel? changeFavoriteServiceModelCubit;
  Future<void> changeFavoriteServiceItem({required String id, context}) async {
    ServiceCubit.get(context).favorites[id] =
        !ServiceCubit.get(context).favorites[id]!;
    emit(ChangeColorFavoriteServiceState());
    var result =
        await FavoriteServiceRepoImpl().changeFavoriteServiceItem(id: id);
    result.fold((failure) {
      // FavCubit.get(context).fetchFavItem();
      FavServiceCubit.get(context).fetchFavServiceItem();
      emit(FailureChangeFavoriteServiceState(failure.error));
    }, ( changeFavoriteServiceModel) {
      emit(SuccessChangeFavoriteServiceState(changeFavoriteServiceModel));
      FavServiceCubit.get(context).fetchFavServiceItem();
      changeFavoriteServiceModelCubit = changeFavoriteServiceModel;
      if (!changeFavoriteServiceModelCubit!.status!) {
        ServiceCubit.get(context).favorites[id] =
            !ServiceCubit.get(context).favorites[id]!;
      }
      debugPrint(changeFavoriteServiceModel.message);
    });
  }
}
//  static ChangeFavoriteCubit get(context) => BlocProvider.of(context);

//   FavPropertyModel? changeFavoriteModelCubit;
//   Future<void> changeFavoriteItem({required String id, context}) async {
//     PropertyCubit.get(context).favorites[id] =
//         !PropertyCubit.get(context).favorites[id]!;
//     emit(ChangeColorFavoriteState());
//     var result = await FavoriteRepoImpl().changeFavoriteItem(id: id);
//     result.fold((failure) {
//       FavCubit.get(context).fetchFavItem();
//       emit(FailureChangeFavoriteState(failure.error));
//     }, (changeFavoriteModel) {
//       emit(SuccessChangeFavoriteState(changeFavoriteModel));
//       FavCubit.get(context).fetchFavItem();
//       changeFavoriteModelCubit = changeFavoriteModel;
//       if (!changeFavoriteModelCubit!.status!) {
//         PropertyCubit.get(context).favorites[id] =
//             !PropertyCubit.get(context).favorites[id]!;
//       }
//       debugPrint(changeFavoriteModel.message);
//     });
//   }
// }
