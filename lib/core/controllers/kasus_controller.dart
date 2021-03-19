import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/affair_model.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/kasus_model.dart';
import 'package:power_on_hand/core/models/provision_model.dart';
import 'package:power_on_hand/core/services/kasus_service.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';

class KasusController extends BaseController {
  static KasusController get to => Get.find();

  List<ProvisionModel> listProvision = [];
  List<AffairModel> listAffair = [];
  List<KasusModel> listKasusHistory;

  var _kasusService = KasusService();

  @override
  void onInit() {
    super.onInit();
    getProvisionList();
    getAffairList();
    getKasusHistoryList();
  }

  Future getProvisionList() async {
    listProvision = await _kasusService.getProvisionList();
    update();
  }

  Future getAffairList() async {
    listAffair = await _kasusService.getAffairList();
    update();
  }

  ProvisionModel getProvisionByAffairChosen(int affairID) {
    return listProvision.firstWhere((el) => el.id == affairID);
  }

  Future uploadKasus({
    @required String uraian,
    @required String dasar,
    @required String rencana,
    @required String motif,
    @required File bukti,
    @required File identitas,
    @required int provisionID,
    @required int affairID,
  }) async {
    DialogUtils.showLoading('Uploading...');
    ApiResponseModel res = await _kasusService.reportStore(
      uraian,
      dasar,
      rencana,
      motif,
      bukti,
      identitas,
      provisionID,
      affairID,
    );

    if (res?.status == 422) {
      DialogUtils.showInfo(res.errors.toString(), closePreDialog: true);
      return;
    }

    if (res?.status == 201) {
      DialogUtils.closeDialog();
      Get.off(() => SuccessScreen(title: 'Kasus Telah Dikirim'));
    } else {
      DialogUtils.showWarning(
        'Pendaftaran gagal, silahkan coba lagi atau hubungi admin',
        closePreDialog: true,
      );
    }
  }

  Future getKasusHistoryList({DateTime date}) async {
    setLoading(true);
    if (date == null) {
      date = DateTime.now();
    }

    var formattedDate = DateFormat("yyyy-MM-dd").format(date);
    listKasusHistory = await _kasusService.getKasusListForAnggota(formattedDate);
    update();

    setLoading(false);
  }
}
