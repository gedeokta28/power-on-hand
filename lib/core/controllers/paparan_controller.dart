import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/services/paparan_service.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';

class PaparanController extends BaseController {
  static PaparanController get to => Get.find();

  var _paparanService = PaparanService();

  @override
  void onInit() {
    super.onInit();
  }

  Future uploadLaporan({@required File file}) async {
    DialogUtils.showLoading('Uploading...');
    ApiResponseModel res = await _paparanService.postPaparan(file);
    if (res?.status == 422) {
      DialogUtils.showInfo(res.errors.toString(), closePreDialog: true);
      return;
    }

    if (res?.status == 201) {
      DialogUtils.closeDialog();
      Get.off(() => SuccessScreen(title: 'Paparan Telah Dikirim'));
    } else {
      DialogUtils.showWarning(
        'Upload gagal, silahkan coba lagi atau hubungi admin',
        closePreDialog: true,
      );
    }
  }
}
