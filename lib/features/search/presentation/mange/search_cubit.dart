// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/search/data/repos/search_repo_impl.dart';
import 'package:sakkiny/features/search/presentation/mange/search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialSearchState());
  static SearchCubit get(context) => BlocProvider.of(context);

  Future<void> getSearch({required String search}) async {
    emit(LoadingSearchState());
    var result = await SearchRepoImpl().fetchSearch(param: search);
    result.fold((failure) {
      print(failure.error);
      emit(FailureSearchState(failure.error));
    }, (result) {
      emit(SuccessSearchState(result));
    });
  }
}
