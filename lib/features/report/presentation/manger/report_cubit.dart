import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/report/data/repo/report_repo_impl.dart';
import 'package:sakkiny/features/report/presentation/manger/report_states.dart';

class ReportCubit extends Cubit<ReportStates> {
  ReportCubit() : super(InitialReportState());
  static ReportCubit get(context) => BlocProvider.of(context);

  void sendReport({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String contactNumber,
    MultipartFile? image,
  }) async {
    emit(LoadingReportState());
    var value = await ReportRepoImpl().sendReport(
      name: name,
      email: email,
      subject: subject,
      message: message,
      contactNumber: contactNumber,
      image: image,
    );
    value.fold((error) {
      emit(FailureReportState(error.toString()));
    }, (reportModel) {
      emit(SuccessReportState(reportModel));
    });
  }
}
