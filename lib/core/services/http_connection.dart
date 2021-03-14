import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/services/base_service.dart';
import 'package:power_on_hand/core/utils/storage_utils.dart';

abstract class HttpConnection extends BaseService {
  StorageUtils storageUtils = Get.find();

  var headers = {
    'Accept': 'application/json',
  };

  //if pure == true, it will return data without parse it to ApiResponseModel
  Future post(String url, {Map<String, String> params, dynamic data, bool needsToken = true, bool pure = false}) async {
    if (needsToken) {
      headers['Authorization'] = "${storageUtils.token}";
    }
    try {
      var resp = await dio.post(url, data: data, queryParameters: params, options: Options(headers: headers));
      if (pure) return resp;
      if (resp.data != null) {
        return ApiResponseModel.fromJson(resp.data);
      }
    } catch (e) {
      return null;
    }
  }

  //if pure == true, it will return data without parse it to ApiResponseModel
  Future get(String url, {Map<String, String> params, bool needsToken = true, bool pure = false}) async {
    if (needsToken) {
      headers['Authorization'] = "${storageUtils.token}";
    }
    try {
      var resp = await dio.get(url, queryParameters: params, options: Options(headers: headers));
      if (pure) return resp;
      if (resp.data != null) {
        return ApiResponseModel.fromJson(resp.data);
      }
    } catch (e) {
      return null;
    }
  }
}
