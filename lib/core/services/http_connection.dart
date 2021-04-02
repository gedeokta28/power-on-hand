import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/services/logging_interceptors.dart';
import 'package:power_on_hand/core/utils/storage_utils.dart';

abstract class HttpConnection {
  // dio init
  Dio _dio() {
    final options = BaseOptions(
      receiveTimeout: 3000,
      connectTimeout: 7000,
      baseUrl: baseURL + 'api',
      contentType: "application/json",

      //! this is important so error code below 500 will not get thrown
      // such as validation error
      validateStatus: (status) {
        return status < 500;
      },
    );
    var dio = Dio(options);

    // adding logging interceptor
    // to show all data flow
    // and add token on specific request
    dio.interceptors.add(LoggingInterceptors());

    return dio;
  }

  Dio get dio => _dio();
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
