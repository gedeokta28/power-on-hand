import 'package:power_on_hand/core/models/affair_model.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/provision_model.dart';
import 'package:power_on_hand/core/services/http_connection.dart';

class DataListService extends HttpConnection {
  Future getAffairList() async {
    ApiResponseModel resp = await get('/affair/list');
    if (resp.status == 200) {
      List<AffairModel> data = [];
      resp.data.forEach((el) {
        data.add(AffairModel.fromJson(el));
      });
      return data;
    }
  }

  Future getProvisionList() async {
    ApiResponseModel resp = await get('/provision/list');
    if (resp.status == 200) {
      List<ProvisionModel> data = [];
      resp.data.forEach((el) {
        data.add(ProvisionModel.fromJson(el));
      });
      return data;
    }
  }
}
