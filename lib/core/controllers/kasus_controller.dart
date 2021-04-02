import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/kasus_model.dart';
import 'package:power_on_hand/core/services/kasus_service.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';

class KasusController extends BaseController {
  static KasusController get to => Get.find();

  List<KasusModel> listKasusByType;
  List<KasusModel> listKasusHistory;
  var _kasusService = KasusService();

  @override
  void onInit() {
    super.onInit();
    getKasusHistoryList();
  }

  Future getKasusListByType(UserType userType) async {
    listKasusByType = await _kasusService.getKasusListForPanitKanit(userType);
    update();
  }

  Future getKasusHistoryList({DateTime date}) async {
    setLoading(true);
    if (date == null) {
      date = DateTime.now();
    }

    var formattedDate = DateFormat("yyyy-MM-dd").format(date);
    listKasusHistory = await _kasusService.getKasusHistory(formattedDate);
    update();

    setLoading(false);
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
