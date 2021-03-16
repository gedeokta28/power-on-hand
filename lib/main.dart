import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/controllers/auth_controller.dart';
import 'package:power_on_hand/core/utils/storage_utils.dart';
import 'package:power_on_hand/ui/screens/home_screen.dart';

void main() async {
  // all async init here
  await GetStorage.init();
  Get.put(StorageUtils());
  Get.put(AuthController());
  runApp(MyApp());
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
