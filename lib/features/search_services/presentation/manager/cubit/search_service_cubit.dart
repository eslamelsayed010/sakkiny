// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/search_services/data/repos/search_services_repo_impl.dart';
import 'package:sakkiny/features/search_services/presentation/manager/cubit/search_service_state.dart';

class SearchserviceCubit extends Cubit<SearchServiceStates> {
  SearchserviceCubit() : super(InitialSearchServiceState());

  static SearchserviceCubit get(context) => BlocProvider.of(context);

  Future<void> getSearchService({required String search}) async {
    emit(LoadingSearchServiceState());
    var result =
        await SearchServiceRepoImpl().fetchSearchService(param: search);
    result.fold((failure) {
      print(failure.error);
      emit(FailureSearchServiceState(failure.error));
    }, (result) {
      emit(SuccessSearchServiceState(result));
    });
  }
}
