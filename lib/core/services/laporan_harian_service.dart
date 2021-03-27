import 'dart:io';

import 'package:dio/dio.dart';
import 'package:power_on_hand/core/services/http_connection.dart';

class LaporanHarianService extends HttpConnection {
  Future postLaporan(
    String namaTsk,
    int affairID,
    File pTkp,
    File pBarangBukti,
    File pKartuIdentitas,
    File pSidikJari,
  ) async {
    FormData _data = FormData.fromMap({
      "name": namaTsk,
      "affair_id": affairID,
      "crime_scene": await MultipartFile.fromFile(pTkp.path),
      "evidence": await MultipartFile.fromFile(pBarangBukti.path),
      "idcard": await MultipartFile.fromFile(pKartuIdentitas.path),
      "fingerprint": await MultipartFile.fromFile(pSidikJari.path),
    });

    return await post('/daily/store', data: _data);
  }

  // get kasus for panit and kanit
  // Future getLaporanHarianListForPanitKanit(UserType userType) async {
  //   int type = 0;
  //   if (userType == UserType.kanit) {
  //     type = 1;
  //   }

  //   ApiResponseModel resp = await get('/report/daily?status=$type');
  //   if (resp.status == 200) {
  //     List<LaporanHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(LaporanHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // get kasus for history
  // Future getLaporanHarianListForAnggota(String formattedDate) async {
  //   ApiResponseModel resp = await get('/daily/history?date=$formattedDate');
  //   if (resp.status == 200) {
  //     List<LaporanHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(LaporanHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // updatestatusmass
  // Future postStatusLaporanHarian(int status, List<int> listLaporanHarianId) async {
  //   FormData _data = FormData.fromMap({
  //     "id": listLaporanHarianId.join(','),
  //     "status": status,
  //   });
  //   return await post('/daily/updatestatusmass', data: _data);
  // }
}
