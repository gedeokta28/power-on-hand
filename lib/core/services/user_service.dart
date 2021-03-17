import 'package:dio/dio.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/title_model.dart';
import 'package:power_on_hand/core/models/user_model.dart';
import 'package:power_on_hand/core/services/http_connection.dart';

class UserService extends HttpConnection {
  Future getListTitle() async {
    ApiResponseModel resp = await get('/title/list', needsToken: false);
    if (resp.status == 200) {
      List<TitleModel> data = [];
      resp.data.forEach((el) {
        data.add(TitleModel.fromJson(el));
      });
      return data;
    }
  }

  Future register(
    String name,
    String email,
    String phone,
    String password,
    int titleId,
  ) async {
    print('titleId');
    print(titleId);
    FormData _data = FormData.fromMap({
      "name": name,
      "title_id": 7,
      "email": email,
      "phone_no": phone,
      "password": password,
      "password_confirmation": password,
    });

    return await post('/auth/register', data: _data, needsToken: false);
  }

  Future login(
    String email,
    String password,
  ) async {
    FormData _data = FormData.fromMap({
      "email": email,
      "password": password,
    });

    return await post('/auth/login', data: _data, needsToken: false, pure: true);
  }

  Future me() async {
    Response res = await post('/auth/me', pure: true);
    if (res.statusCode == 200) {
      return UserModel.fromJson(res.data);
    }
  }
}
