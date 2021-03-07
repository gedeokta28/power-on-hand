import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('height');
    print(Get.height);

    print('width');
    print(Get.width);

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
