import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/models/affair_model.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/kategori_penilaian_model.dart';
import 'package:power_on_hand/core/models/laporan_model.dart';
import 'package:power_on_hand/core/models/provision_model.dart';
import 'package:power_on_hand/core/services/data_list_service.dart';
import 'package:power_on_hand/core/services/kasus_service.dart';
import 'package:power_on_hand/core/services/laporan_harian_service.dart';
import 'package:power_on_hand/core/services/laporan_service.dart';
import 'package:power_on_hand/core/services/penilaian_service.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';

class AnggotaController extends BaseController {
  static AnggotaController get to => Get.find();

  List<ProvisionModel> listProvision = [];
  List<AffairModel> listAffair = [];
  List<LaporanModel> listLaporan;
  List<KategoriPenilaianModel> listKategoriPenilaian;

  // var for helping search
  List<KategoriPenilaianModel> pureListKategoriPenilaian;

  var _kasusService = KasusService();
  var _dataService = DataListService();
  var _laporanHarianService = LaporanHarianService();
  var _laporanService = LaporanService();
  var _penilaianService = PenilaianService();

  @override
  void onInit() {
    super.onInit();
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

  // function to get laporan list for penilaian form
  Future getLaporanList() async {
    listLaporan = await _laporanService.getAllLaporanList();
    update();
  }

  // function to get kategori list for penilaian form
  Future getKategoriPenilaianList() async {
    listKategoriPenilaian = await _penilaianService.getKategoriList();
    update();
  }

  void searchKategoriPenilaian(String query) {
    if (pureListKategoriPenilaian == null) {
      pureListKategoriPenilaian = [];
      pureListKategoriPenilaian.addAll(listKategoriPenilaian);
    }

    // if empty return the pure data
    if (query.trim().isEmpty) {
      listKategoriPenilaian.clear();
      listKategoriPenilaian.addAll(pureListKategoriPenilaian);
      update();
      return;
    }

    listKategoriPenilaian = pureListKategoriPenilaian
        .where(
          (member) => member.description.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
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

  Future uploadLaporanHarian({
    @required String namaTsk,
    @required int affairID,
    @required File pTkp,
    @required File pBarangBukti,
    @required File pKartuIdentitas,
    @required File pSidikJari,
  }) async {
    DialogUtils.showLoading('Uploading...');
    ApiResponseModel res = await _laporanHarianService.postLaporan(
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
      Get.off(() => SuccessScreen(title: 'Laporan Lapangan Telah Dikirim'));
    } else {
      DialogUtils.showWarning(
        'Upload gagal, silahkan coba lagi atau hubungi admin',
        closePreDialog: true,
      );
    }
  }

  Future uploadPenilaian({
    @required String kategoriId,
    @required String laporanId,
    @required File pFile,
  }) async {
    DialogUtils.showLoading('Uploading...');
    ApiResponseModel res = await _penilaianService.postPenilaian(
      kategoriId,
      laporanId,
      pFile,
    );

    if (res?.status == 422) {
      DialogUtils.showInfo(res.errors.toString(), closePreDialog: true);
      return;
    }

    if (res?.status == 201) {
      DialogUtils.closeDialog();
      Get.off(() => SuccessScreen(title: 'Penilaian Telah Dikirim'));
    } else {
      DialogUtils.showWarning(
        'Upload gagal, silahkan coba lagi atau hubungi admin',
        closePreDialog: true,
      );
    }
  }
}
