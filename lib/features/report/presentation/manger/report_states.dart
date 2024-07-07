import 'package:sakkiny/features/report/data/model/report_model/report_model.dart';

abstract class ReportStates {}

class InitialReportState extends ReportStates {}

class LoadingReportState extends ReportStates {}

class SuccessReportState extends ReportStates {
  final ReportModel reportModel;
  SuccessReportState(this.reportModel);
}

class FailureReportState extends ReportStates {
  final String error;
  FailureReportState(this.error);
}
