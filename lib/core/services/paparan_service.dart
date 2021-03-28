import 'dart:io';

import 'package:dio/dio.dart';
import 'package:power_on_hand/core/services/http_connection.dart';

class PaparanService extends HttpConnection {
  Future postPaparan(File file) async {
    FormData _data = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path),
    });

    return await post('/exposure/store', data: _data);
  }

  // // get kasus for panit and kanit
  // Future getPaparanHarianListForPanitKanit(UserType userType) async {
  //   int type = 0;
  //   if (userType == UserType.kanit) {
  //     type = 1;
  //   }

  //   ApiResponseModel resp = await get('/report/exposure?status=$type');
  //   if (resp.status == 200) {
  //     List<PaparanHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(PaparanHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // // get kasus for history
  // Future getPaparanHarianListForAnggota(String formattedDate) async {
  //   ApiResponseModel resp = await get('/exposure/history?date=$formattedDate');
  //   if (resp.status == 200) {
  //     List<PaparanHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(PaparanHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // updatestatusmass
  // Future postStatusPaparan(int status, List<int> listPaparanHarianId) async {
  //   FormData _data = FormData.fromMap({
  //     "id": listPaparanHarianId.join(','),
  //     "status": status,
  //   });
  //   return await post('/exposure/updatestatusmass', data: _data);
  // }
}
