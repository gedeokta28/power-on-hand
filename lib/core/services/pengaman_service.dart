import 'dart:io';
import 'package:dio/dio.dart';
import 'package:power_on_hand/core/services/http_connection.dart';

class PengamanService extends HttpConnection {
  Future postPengaman(
    String dasar,
    String nama,
    String duration,
    File pFile,
    double latitude,
    double longitude,
  ) async {
    FormData _data = FormData.fromMap({
      "sprint": dasar,
      "name": nama,
      "duration": duration,
      "latitude": latitude,
      "longitude": longitude,
      "file": await MultipartFile.fromFile(pFile.path),
    });

    return await post('/safety/store', data: _data);
  }

  // // get kasus for panit and kanit
  // Future getPengamanHarianListForPanitKanit(UserType userType) async {
  //   int type = 0;
  //   if (userType == UserType.kanit) {
  //     type = 1;
  //   }

  //   ApiResponseModel resp = await get('/report/safety?status=$type');
  //   if (resp.status == 200) {
  //     List<PengamanHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(PengamanHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // // get kasus for history
  // Future getPengamanHarianListForAnggota(String formattedDate) async {
  //   ApiResponseModel resp = await get('/safety/history?date=$formattedDate');
  //   if (resp.status == 200) {
  //     List<PengamanHarianModel> data = [];
  //     resp.data.forEach((el) {
  //       data.add(PengamanHarianModel.fromJson(el));
  //     });
  //     return data;
  //   }
  // }

  // updatestatusmass
  // Future postStatusPengaman(int status, List<int> listPengamanHarianId) async {
  //   FormData _data = FormData.fromMap({
  //     "id": listPengamanHarianId.join(','),
  //     "status": status,
  //   });
  //   return await post('/safety/updatestatusmass', data: _data);
  // }
}
