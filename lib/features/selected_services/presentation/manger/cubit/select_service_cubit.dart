// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sakkiny/features/selected_services/data/repo/select_services_repo_impl.dart';
import 'package:sakkiny/features/selected_services/presentation/manger/cubit/select_service_state.dart';

class SelectServiceCubit extends Cubit<SelectServiceStates> {
  SelectServiceCubit() : super(InitialSelectServiceState());
  static SelectServiceCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSelectService({required String idService}) async {
    emit(LoadingSelectServiceStates());
    var result =
        await SelectServiceRepoImpl().fetchSelectService(idService: idService);
    result.fold((failure) {
      emit(FailureSelectServiceStates(failure.error));
      print(failure.error);
    }, (service) {
      emit(SuccessSelectServiceStates(service));
    });
  }
}
