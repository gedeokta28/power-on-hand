import 'dart:io';

import 'package:dio/dio.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/kasus_model.dart';
import 'package:power_on_hand/core/services/http_connection.dart';

class KasusService extends HttpConnection {
  Future reportStore(
    String uraian,
    String dasar,
    String rencana,
    String motif,
    File bukti,
    File identitas,
    int provisionID,
    int affairID,
  ) async {
    // String buktiName = bukti.path.split('/').last;
    // String identitasName = identitas.path.split('/').last;

    FormData _data = FormData.fromMap({
      "description": uraian,
      "anvil": dasar,
      "evidence": await MultipartFile.fromFile(bukti.path),
      "idcard": await MultipartFile.fromFile(identitas.path),
      "persuasive": motif,
      "affair_id": affairID,
      "provision_id": provisionID,
      "plan": rencana,
    });

    return await post('/report/store', data: _data);
  }

  // get kasus for panit and kanit
  Future getKasusListForPanitKanit(UserType userType) async {
    int type = 0;
    if (userType == UserType.kanit) {
      type = 1;
    }

    ApiResponseModel resp = await get('/report/list?status=$type');
    if (resp.status == 200) {
      List<KasusModel> data = [];
      resp.data.forEach((el) {
        data.add(KasusModel.fromJson(el));
      });
      return data;
    }
  }

  // get kasus for history
  Future getKasusHistory(String formattedDate) async {
    ApiResponseModel resp = await get('/report/history?date=$formattedDate');
    if (resp.status == 200) {
      List<KasusModel> data = [];
      resp.data.forEach((el) {
        data.add(KasusModel.fromJson(el));
      });
      return data;
    }
  }

  // updatestatusmass
  Future postStatusKasus(int status, List<int> listKasusId) async {
    FormData _data = FormData.fromMap({
      "id": listKasusId.join(','),
      "status": status,
    });
    return await post('/report/updatestatusmass', data: _data);
  }

  // get kasus for history
  Future getKasusDetail(int id) async {
    ApiResponseModel resp = await get('/report/show?id=$id');
    if (resp.status == 200) {
      return KasusModel.fromJson(resp.data);
    }
  }
}
