import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/core/models/chart/daily_model.dart';
import 'package:power_on_hand/core/services/chart_service.dart';

class StatistikController extends BaseController {
  static StatistikController get to => Get.find();

  var _chartService = ChartService();

  List<DailyModel> listStatistik;

  Future getStatistikChart(DateTime date) async {
    setLoading(true);
    // choose accordingly usertype
    UserType userType;
    switch (UserController.to.user.title) {
      case "kanit":
        userType = UserType.kanit;
        break;
      case "panit":
        userType = UserType.panit;
        break;
      case "anggota":
        userType = UserType.anggota;
        break;
      default:
        break;
    }
    var formattedDate = DateFormat("yyyy-MM-dd").format(date);
    listStatistik = await _chartService.getStatistikPenilaianChart(formattedDate, userType);
    setLoading(false);
    update();
  }
}
