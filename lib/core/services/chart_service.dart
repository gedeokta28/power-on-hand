import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/chart/daily_model.dart';
import 'package:power_on_hand/core/models/chart/report_model.dart';
import 'package:power_on_hand/core/models/chart/valuation_model.dart';
import 'package:power_on_hand/core/services/http_connection.dart';

class ChartService extends HttpConnection {
  Future getAnggotaChart() async {
    ApiResponseModel resp = await get('/chart/daily');
    if (resp.status == 200) {
      List<DailyModel> data = [];
      resp.data.forEach((el) {
        data.add(DailyModel.fromJson(el));
      });
      return data;
    }
  }

  Future getValuationChart() async {
    ApiResponseModel resp = await get('/chart/valuation');
    if (resp.status == 200) {
      List<ValuationModel> data = [];
      resp.data.forEach((el) {
        data.add(ValuationModel.fromJson(el));
      });
      return data;
    }
  }

  Future getReportChart() async {
    ApiResponseModel resp = await get('/chart/report');
    if (resp.status == 200) {
      List<ReportModel> data = [];
      resp.data.forEach((el) {
        data.add(ReportModel.fromJson(el));
      });
      return data;
    }
  }
}
