import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/home/data/repos/home_repo_impl.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_states.dart';

class PropertyCubit extends Cubit<PropertyStates> {
  PropertyCubit() : super(InitialPropertyState());
  static PropertyCubit get(context) => BlocProvider.of(context);

  Map<String?, bool?> favorites = {};

  Future<void> fetchProperty() async {
    emit(LoadingPropertyState());
    var result = await HomeRepoImpl().fetchProperty();
    result.fold((failure) {
      emit(FailurePropertyState(failure.error));
    }, (properties) {
      favorites = {
        for (var element in properties)
          element.id: element.likesCount != null && element.likesCount! > 0
      };
      emit(SuccessPropertyState(properties));
    });
  }
}
