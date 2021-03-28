import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/kasus_model.dart';
import 'package:power_on_hand/core/services/kasus_service.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';

class KasusController extends BaseController {
  static KasusController get to => Get.find();

  List<KasusModel> listKasusHistory;
  var _kasusService = KasusService();

  @override
  void onInit() {
    super.onInit();
  }

  Future getKasusHistoryList(UserType userType) async {
    listKasusHistory = await _kasusService.getKasusListForPanitKanit(userType);
    update();
  }

  Future updateStatusKasus({
    @required int status,
    @required List<int> listKasusId,
  }) async {
    DialogUtils.showLoading('Uploading...');

    ApiResponseModel res = await _kasusService.postStatusKasus(
      status,
      listKasusId,
    );
    if (res?.status == 200) {
      DialogUtils.closeDialog();
      Get.off(() => SuccessScreen(title: 'Kasus Telah Dikirim'));
    } else {
      DialogUtils.showInfo(res.errors.toString(), closePreDialog: true);
    }
  }
}
