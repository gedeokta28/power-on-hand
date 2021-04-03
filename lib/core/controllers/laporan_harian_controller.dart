import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/laporan_harian_model.dart';
import 'package:power_on_hand/core/services/laporan_harian_service.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';

class LaporanHarianController extends BaseController {
  static LaporanHarianController get to => Get.find();

  List<LaporanHarianModel> listLaporanHarian;
  var _laporanHarianService = LaporanHarianService();
  LaporanHarianModel laporanDetail;
  @override
  void onInit() {
    super.onInit();
  }

  Future getLaporanHarianList(UserType userType) async {
    listLaporanHarian = await _laporanHarianService.getLaporanHarianListForUserType(userType);
    update();
  }

  Future updateStatusLaporanHarian({
    @required int status,
    @required List<int> listKasusId,
  }) async {
    DialogUtils.showLoading('Uploading...');

    ApiResponseModel res = await _laporanHarianService.postStatusLaporanHarian(
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

  Future getLaporanDetail(int id) async {
    setLoading(true);
    laporanDetail = await _laporanHarianService.getLaporanDetail(id);
    update();
    setLoading(false);
  }
}
