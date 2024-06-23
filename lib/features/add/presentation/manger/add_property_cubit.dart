// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/add/data/repos/add_property_repo_impl.dart';
import 'package:sakkiny/features/add/presentation/manger/add_property_state.dart';

class AddPropertyCubit extends Cubit<AddPropertyState> {
  AddPropertyCubit() : super(AddPropertyInitial());
  static AddPropertyCubit get(context) => BlocProvider.of(context);

  Future<void> addProperty({
    required bool isFurnished,
    required int price,
    required int bedrooms,
    required String level,
    required int? bathrooms,
    required int area,
    required String details,
    required String address,
    required num lat,
    required num lang,
    required List<MultipartFile> propertyImages,
    required String type,
    required String per,
    required String description,
    required String addedByType,
  }) async {
    emit(AddPropertyLoading());
    var result = await AddRepoImpl().addProperty(
      type: type,
      description: description,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      details: details,
      level: level,
      area: area,
      price: price,
      per: per,
      isFurnished: isFurnished,
      address: address,
      long: lang,
      lat: lat,
      propertyImages: propertyImages,
      addedByType: addedByType,
    );
    result.fold((error) {
      emit(AddPropertyFailure(error: error.toString()));
      print(error);
    }, (addPropertyModel) {
      emit(AddPropertySuccess(addPropertyModel: addPropertyModel));
    });
  }
}
