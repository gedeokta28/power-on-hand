import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/affair_model.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/chart/daily_model.dart';
import 'package:power_on_hand/core/models/kasus_model.dart';
import 'package:power_on_hand/core/models/provision_model.dart';
import 'package:power_on_hand/core/services/chart_service.dart';
import 'package:power_on_hand/core/services/data_list_service.dart';
import 'package:power_on_hand/core/services/kasus_service.dart';
import 'package:power_on_hand/core/services/laporan_harian_service.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';

class AnggotaController extends BaseController {
  static AnggotaController get to => Get.find();

  List<ProvisionModel> listProvision = [];
  List<AffairModel> listAffair = [];
  List<KasusModel> listKasusHistory;
  List<DailyModel> listStatistik;

  var _kasusService = KasusService();
  var _chartService = ChartService();
  var _dataService = DataListService();
  var _laporahHarianService = LaporanHarianService();

  @override
  void onInit() {
    super.onInit();
    getKasusHistoryList();
    getAnggotaChart();
  }

  Future getProvisionList() async {
    listProvision = await _dataService.getProvisionList();
    update();
  }

  Future getAffairList() async {
    listAffair = await _dataService.getAffairList();
    update();
  }

  ProvisionModel getProvisionByAffairChosen(int affairID) {
    return listProvision.firstWhere((el) => el.id == affairID);
  }

  Future getAnggotaChart() async {
    listStatistik = await _chartService.getAnggotaChart();
    update();
  }

  //* Kasus Function Starts
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
        'Upload gagal, silahkan coba lagi atau hubungi admin',
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

  //* Kasus Function Starts
  Future uploadLaporanHarian({
    @required String namaTsk,
    @required int affairID,
    @required File pTkp,
    @required File pBarangBukti,
    @required File pKartuIdentitas,
    @required File pSidikJari,
  }) async {
    DialogUtils.showLoading('Uploading...');
    ApiResponseModel res = await _laporahHarianService.postLaporan(
      namaTsk,
      affairID,
      pTkp,
      pBarangBukti,
      pKartuIdentitas,
      pSidikJari,
    );

    if (res?.status == 422) {
      DialogUtils.showInfo(res.errors.toString(), closePreDialog: true);
      return;
    }

    if (res?.status == 201) {
      DialogUtils.closeDialog();
      Get.off(() => SuccessScreen(title: 'Laporan Harian Telah Dikirim'));
    } else {
      DialogUtils.showWarning(
        'Upload gagal, silahkan coba lagi atau hubungi admin',
        closePreDialog: true,
      );
    }
  }
}
