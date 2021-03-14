import 'package:dio/dio.dart';
import 'package:power_on_hand/core/services/logging_interceptors.dart';

class BaseService {
  Dio _dio() {
    final options = BaseOptions(
      receiveTimeout: 3000,
      connectTimeout: 15000,
      baseUrl: 'https://poh.kediriapp.com/api',
      contentType: "application/json",

      //! this is important so error code below 500 will not get thrown
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
}
