import 'package:get/get.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/kasus_model.dart';
import 'package:power_on_hand/core/services/kasus_service.dart';

class PanitController extends BaseController {
  static PanitController get to => Get.find();

  List<KasusModel> listKasusHistory;

  var _kasusService = KasusService();

  @override
  void onInit() {
    super.onInit();
    getKasusHistoryList();
  }

  Future getKasusHistoryList() async {
    setLoading(true);
    listKasusHistory = await _kasusService.getKasusListForPanitKanit(UserType.panit);
    update();
    setLoading(false);
  }
}
