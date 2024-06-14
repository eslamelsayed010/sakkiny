import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/home/data/repos/home_repo_impl.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_states.dart';

class PropertyCubit extends Cubit<PropertyStates> {
  PropertyCubit() : super(InitialPropertyState());
  static PropertyCubit get(context) => BlocProvider.of(context);

  Map<int?, bool?> favorites = {};

  Future<void> fetchProperty() async {
    emit(LoadingPropertyState());
    var result = await HomeRepoImpl().fetchProperty();
    result.fold((failure) {
      emit(FailurePropertyState(failure.error));
    }, (properties) {
      // for (var element in homeModel.data!.products!) {
      //   favorites.addAll({element.id: element.inFavorites});
      // }
      emit(SuccessPropertyState(properties));
    });
  }
}
