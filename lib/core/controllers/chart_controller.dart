import 'package:get/get.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/chart/report_model.dart';
import 'package:power_on_hand/core/models/chart/valuation_model.dart';
import 'package:power_on_hand/core/services/chart_service.dart';

class ChartController extends BaseController {
  static ChartController get to => Get.find();

  List<ValuationModel> listValuationChart;
  List<ReportModel> listReportChart;

  var _chartService = ChartService();

  @override
  void onInit() {
    super.onInit();
    getValuationChart();
    getReportChart();
  }

  Future getValuationChart() async {
    listValuationChart = await _chartService.getValuationChart();
    update();
  }

  Future getReportChart() async {
    listReportChart = await _chartService.getReportChart();
    update();
  }
}
