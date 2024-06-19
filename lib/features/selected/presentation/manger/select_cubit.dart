// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/selected/data/repo/select_repo_impl.dart';
import 'package:sakkiny/features/selected/presentation/manger/select_states.dart';

class SelectCubit extends Cubit<SelectStates> {
  SelectCubit() : super(InitialSelectPropertyState());
  static SelectCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSelectProperty({required String idProperty}) async {
    emit(LoadingSelectPropertyStates());
    var result =
        await SelectRepoImpl().fetchSelectProperty(idProperty: idProperty);
    result.fold((failure) {
      emit(FailureSelectPropertyStates(failure.error));
      print(failure.error);
    }, (property) {
      emit(SuccessSelectPropertyStates(property));
    });
  }
}
