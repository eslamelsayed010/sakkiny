import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sakkiny/features/services/data/repos/services_repo_impl.dart';
import 'package:sakkiny/features/services/presentation/manger/cubit/service_state.dart';

class ServiceCubit extends Cubit<ServiceStates> {
  ServiceCubit() : super(InitialServiceState());
  static ServiceCubit get(context) => BlocProvider.of(context);

  Map<int?, bool?> favorites = {};

  Future<void> fetchService() async {
    emit(LoadingServiceState());
    var result = await ServiceRepoImpl().fetchService();
    result.fold((failure) {
      emit(FailureServiceState(failure.error));
    }, (service) {
      // for (var element in homeModel.data!.products!) {
      //   favorites.addAll({element.id: element.inFavorites});
      // }
      emit(SuccessServiceState(service));
    });
  }
}
