import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/controllers/anggota_controller.dart';
import 'package:power_on_hand/core/controllers/chart_controller.dart';
import 'package:power_on_hand/core/controllers/direktur_controller.dart';
import 'package:power_on_hand/core/controllers/kanit_controller.dart';
import 'package:power_on_hand/core/controllers/kasus_controller.dart';
import 'package:power_on_hand/core/controllers/laporan_controller.dart';
import 'package:power_on_hand/core/controllers/laporan_harian_controller.dart';
import 'package:power_on_hand/core/controllers/panit_controller.dart';
import 'package:power_on_hand/core/controllers/paparan_controller.dart';
import 'package:power_on_hand/core/controllers/statistik_controller.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/core/utils/gps_utils.dart';
import 'package:power_on_hand/core/utils/storage_utils.dart';
import 'package:power_on_hand/ui/screens/home_screen.dart';

void main() async {
  // all async init here
  await GetStorage.init();
  Get.put(StorageUtils());
  Get.put(UserController());
  Get.lazyPut(() => AnggotaController(), fenix: true);
  Get.lazyPut(() => PanitController(), fenix: true);
  Get.lazyPut(() => KanitController(), fenix: true);
  Get.lazyPut(() => DirekturController(), fenix: true);
  Get.lazyPut(() => ChartController(), fenix: true);
  Get.lazyPut(() => LaporanController(), fenix: true);
  Get.lazyPut(() => PaparanController(), fenix: true);
  Get.lazyPut(() => KasusController(), fenix: true);
  Get.lazyPut(() => LaporanHarianController(), fenix: true);
  Get.lazyPut(() => StatistikController(), fenix: true);

  GPSUtils.getCurrentLocation();

  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      textStyle: GoogleFonts.varelaRound(),
      textPadding: EdgeInsets.all(10.0),
      child: GetMaterialApp(
        title: 'Power On Hand',
        // device preview starts here
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        // device preview ends here
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
