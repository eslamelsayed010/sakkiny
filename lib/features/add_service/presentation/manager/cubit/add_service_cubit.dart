// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/add_service/data/repos/add_service_repo_impl.dart';
import 'package:sakkiny/features/add_service/presentation/manager/cubit/add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  AddServiceCubit() : super(AddServiceInitial());

  static AddServiceCubit get(context) => BlocProvider.of(context);

  Future<void> addService({
    required int price,
    required String serviceCategory,
    required String address,
    required num lat,
    required num long,
    required List<MultipartFile> propertyImages,
    required String description,
  }) async {
    emit(AddServiceLoading());
    var result = await AddServiceRepoImpl().addService(
        price: price,
        serviceCategory: serviceCategory,
        address: address,
        lat: lat,
        long: long,
        propertyImages: propertyImages,
        description: description);
    result.fold((error) {
      emit(AddServiceFailure(error: error.toString()));
      print('Error: $error');
    }, (serviceModel) {
      emit(AddServiceSuccess(serviceModel: serviceModel));
    });
  }
}
