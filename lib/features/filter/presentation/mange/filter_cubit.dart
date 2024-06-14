import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/filter/data/repos/filter_repo_impl.dart';
import 'package:sakkiny/features/filter/presentation/mange/filter_state.dart';

class FilterCubit extends Cubit<FilterStates> {
  FilterCubit() : super(InitialFilterState());
  static FilterCubit get(context) => BlocProvider.of(context);

  Future<void> getFilterSearch({
    required int priceGte,
    required int priceLte,
    required int areaGte,
    required int areaLte,
    required String type,
    required String per,
  }) async {
    emit(LoadingFilterState());
    var result = await FilterRepoImpl().fetchFilter(
      priceGte: priceGte,
      priceLte: priceLte,
      areaGte: areaGte,
      areaLte: areaLte,
      type: type,
      per: per,
    );
    result.fold((failure) {
      emit(FailureFilterState(failure.error));
    }, (result) {
      emit(SuccessFilterState(result));
    });
  }
}
