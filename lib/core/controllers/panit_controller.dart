import 'package:get/get.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';

class PanitController extends BaseController {
  static PanitController get to => Get.find();

  // List<KasusModel> listKasusHistory;

  // var _kasusService = KasusService();

  @override
  void onInit() {
    super.onInit();
    // getKasusHistoryList();
  }

  // Future getKasusHistoryList() async {
  //   setLoading(true);
  //   listKasusHistory = await _kasusService.getKasusListForPanitKanit(UserType.panit);
  //   update();
  //   setLoading(false);
  // }

  // Future updateStatusKasus({
  //   @required int status,
  //   @required List<int> listKasusId,
  // }) async {
  //   DialogUtils.showLoading('Uploading...');

  //   ApiResponseModel res = await _kasusService.postStatusKasus(
  //     status,
  //     listKasusId,
  //   );
  //   if (res?.status == 200) {
  //     DialogUtils.closeDialog();
  //     Get.off(() => SuccessScreen(title: 'Kasus Telah Dikirim'));
  //   } else {
  //     DialogUtils.showInfo(res.errors.toString(), closePreDialog: true);
  //   }
  // }
}
