import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/services/pengaman_service.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';

class PengamanController extends BaseController {
  static PengamanController get to => Get.find();

  var _pengamanService = PengamanService();

  @override
  void onInit() {
    super.onInit();
  }

  Future uploadLaporan({
    @required String dasar,
    @required String nama,
    @required String duration,
    @required File pFile,
    @required double latitude,
    @required double longitude,
  }) async {
    DialogUtils.showLoading('Uploading...');
    ApiResponseModel res = await _pengamanService.postPengaman(
      dasar,
      nama,
      duration,
      pFile,
      latitude,
      longitude,
    );

    if (res?.status == 422) {
      DialogUtils.showInfo(res.errors.toString(), closePreDialog: true);
      return;
    }

    if (res?.status == 201) {
      DialogUtils.closeDialog();
      Get.off(() => SuccessScreen(title: 'Pengaman Telah Dikirim'));
    } else {
      DialogUtils.showWarning(
        'Upload gagal, silahkan coba lagi atau hubungi admin',
        closePreDialog: true,
      );
    }
  }
}
