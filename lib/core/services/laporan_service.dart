import 'dart:io';

import 'package:dio/dio.dart';
import 'package:power_on_hand/core/services/http_connection.dart';

class LaporanService extends HttpConnection {
  Future postLaporan(
    String nomor,
    String type,
    File pFile,
  ) async {
    FormData _data = FormData.fromMap({
      "nomor": nomor,
      "type": type,
      "file": await MultipartFile.fromFile(pFile.path),
    });

    return await post('/policyreport/store', data: _data);
  }

  // // get kasus for panit and kanit
  // Future getLaporanHarianListForPanitKanit(UserType userType) async {
  //   int type = 0;
  //   if (userType == UserType.kanit) {
  //     type = 1;
  //   }

  //   ApiResponseModel resp = await get('/report/policyreport?status=$type');
  //   if (resp.status == 200) {
  //     List<LaporanHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(LaporanHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // // get kasus for history
  // Future getLaporanHarianListForAnggota(String formattedDate) async {
  //   ApiResponseModel resp = await get('/policyreport/history?date=$formattedDate');
  //   if (resp.status == 200) {
  //     List<LaporanHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(LaporanHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // updatestatusmass
  Future postStatusLaporan(int status, List<int> listLaporanHarianId) async {
    FormData _data = FormData.fromMap({
      "id": listLaporanHarianId.join(','),
      "status": status,
    });
    return await post('/policyreport/updatestatusmass', data: _data);
  }
}
