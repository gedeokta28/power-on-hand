import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/kasus_model.dart';
import 'package:power_on_hand/core/services/kasus_service.dart';

class KanitController extends BaseController {
  static KanitController get to => Get.find();

  List<KasusModel> listKasusHistory;

  var _kasusService = KasusService();

  @override
  void onInit() {
    super.onInit();
    getKasusHistoryList();
  }

  Future getKasusHistoryList() async {
    setLoading(true);
    listKasusHistory = await _kasusService.getKasusListForPanitKanit(UserType.kanit);
    update();
    setLoading(false);
  }
}
