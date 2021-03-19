import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/models/api_reponse_model.dart';
import 'package:power_on_hand/core/models/title_model.dart';
import 'package:power_on_hand/core/models/user_model.dart';
import 'package:power_on_hand/core/services/user_service.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/core/utils/storage_utils.dart';
import 'package:power_on_hand/ui/screens/home_screen.dart';
import 'package:power_on_hand/ui/screens/register_success_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/direktur_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kasubdit/dashboard/kasubdit_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/panit/panit_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/wadir/wadir_dashboard_screen.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  List<TitleModel> listTitle = [];
  UserModel user;

  var _userService = UserService();

  @override
  void onInit() async {
    super.onInit();
    if (StorageUtils.to.token != null) {
      await getUser();
      if (user?.name != null) {
        sendToDashboard();
      }
    }
  }

  // Get title list to use in register
  Future getTitleList() async {
    listTitle = await _userService.getListTitle();
    update();
  }

  Future register({
    @required String name,
    @required String email,
    @required String phone,
    @required String password,
    @required int titleId,
  }) async {
    DialogUtils.showLoading('Registering...');
    ApiResponseModel res = await _userService.register(
      name,
      email,
      phone,
      password,
      titleId,
    );

    if (res?.status == 422) {
      DialogUtils.showInfo(res.errors.toString(), closePreDialog: true);
      return;
    }

    if (res?.status == 201) {
      DialogUtils.closeDialog();
      Get.off(() => RegisterSuccessScreen());
    } else {
      DialogUtils.showWarning('Pendaftaran gagal, silahkan coba lagi atau hubungi admin', closePreDialog: true);
    }
  }

  Future login({
    @required String email,
    @required String password,
  }) async {
    DialogUtils.showLoading('Login in..');
    dio.Response res = await _userService.login(email, password);

    //* Throw errors
    if (res.statusCode >= 400) {
      DialogUtils.showInfo(res.data['errors'].toString(), closePreDialog: true);
      return;
    }

    if (res?.statusCode == 200) {
      //* Save token
      var token = res.data['access_token'];
      StorageUtils.to.saveToken(token);

      await getUser();
      sendToDashboard();
    } else {
      DialogUtils.showWarning('Login gagal, silahkan coba lagi atau hubungi admin', closePreDialog: true);
    }
  }

  Future getUser() async {
    user = await _userService.me();
    update();
  }

// Send user to their dashboard according to role
  void sendToDashboard() {
    print(user.title);
    switch (user.title) {
      case "direktur":
        Get.offAll(() => DirekturDashboardScreen());
        break;
      case "wadir":
        Get.offAll(() => WadirDashboardScreen());
        break;
      case "kasubdit":
        Get.offAll(() => KasubditDashboardScreen());
        break;
      case "kanit":
        Get.offAll(() => KanitDashboardScreen());
        break;
      case "panit":
        Get.offAll(() => PanitDashboardScreen());
        break;
      case "anggota":
        Get.offAll(() => AnggotaDashboardScreen());
        break;
      default:
        Get.offAll(() => AnggotaDashboardScreen());
        break;
    }
  }

  void logout() async {
    DialogUtils.showChoose('Anda mau keluar ?', 'Ya', onClick: () async {
      await StorageUtils.to.storage.erase();
      Get.offAll(() => HomeScreen());
    });
  }

  Future updateStatus({
    @required String status,
  }) async {
    DialogUtils.showLoading('Updating...', closePreDialog: true);
    ApiResponseModel res = await _userService.updateStatus(status);

    //* Throw errors
    if (res.status >= 400) {
      DialogUtils.showInfo(res.data['errors'].toString());
      return;
    }

    if (res?.status == 200) {
      DialogUtils.showInfo('Status update success', closePreDialog: true);
      getUser();
    } else {
      DialogUtils.showWarning('Login gagal, silahkan coba lagi atau hubungi admin');
    }
  }
}
