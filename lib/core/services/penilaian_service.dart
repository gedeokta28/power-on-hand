import 'dart:io';

import 'package:dio/dio.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/basic_list_model.dart';
import 'package:power_on_hand/core/services/http_connection.dart';

class PenilaianService extends HttpConnection {
  Future postPenilaian(
    String kategoryId,
    String laporanId,
    File pFile,
  ) async {
    FormData _data = FormData.fromMap({
      "category_id": kategoryId,
      "policy_report_id": laporanId,
      "file": await MultipartFile.fromFile(pFile.path),
    });

    return await post('/assessment/store', data: _data);
  }

  Future getKategoriList() async {
    ApiResponseModel resp = await get('/category/list');
    if (resp.status == 200) {
      List<BasicListModel> data = [];
      resp.data.forEach((el) {
        data.add(BasicListModel.fromJson(el));
      });
      return data;
    }
  }

  // // get kasus for panit and kanit
  // Future getPenilaianHarianListForPanitKanit(UserType userType) async {
  //   int type = 0;
  //   if (userType == UserType.kanit) {
  //     type = 1;
  //   }

  //   ApiResponseModel resp = await get('/report/assessment?status=$type');
  //   if (resp.status == 200) {
  //     List<PenilaianHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(PenilaianHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // // get kasus for history
  // Future getPenilaianHarianListForAnggota(String formattedDate) async {
  //   ApiResponseModel resp = await get('/assessment/history?date=$formattedDate');
  //   if (resp.status == 200) {
  //     List<PenilaianHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(PenilaianHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // updatestatusmass
  // Future postStatusPenilaian(int status, List<int> listPenilaianHarianId) async {
  //   FormData _data = FormData.fromMap({
  //     "id": listPenilaianHarianId.join(','),
  //     "status": status,
  //   });
  //   return await post('/assessment/updatestatusmass', data: _data);
  // }
}
