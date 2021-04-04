import 'package:dio/dio.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/basic_list_model.dart';
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

  Future position(
    double latitude,
    double longitude,
  ) async {
    FormData _data = FormData.fromMap({
      "latitude": latitude,
      "longitude": longitude,
    });

    return await post('/user/position', data: _data);
  }

  Future me() async {
    Response res = await post('/auth/me', pure: true);
    if (res.statusCode == 200) {
      return UserModel.fromJson(res.data);
    }
  }

  Future updateStatus(String status) async {
    FormData _data = FormData.fromMap({"work": status});

    return await post('/user/updatestatus', data: _data);
  }

  Future postUpdate(
    String birthDate,
    String gender,
    String phone,
    String name,
    int gradeId,
  ) async {
    FormData _data = FormData.fromMap({
      "birth_date": birthDate,
      "gender": gender,
      "phone_no": phone,
      "grade_id": gradeId,
      "name": name,
    });

    return await post('/user/update', data: _data);
  }

  Future getGradeList() async {
    ApiResponseModel resp = await get('/grade/list');
    if (resp.status == 200) {
      List<BasicListModel> data = [];
      resp.data.forEach((el) {
        data.add(BasicListModel.fromJson(el));
      });
      return data;
    }
  }

  Future getUserPoint() async {
    Response res = await get('/assessment/point', pure: true);
    if (res.statusCode == 200) {
      return res.data['point'];
    }
  }
}
