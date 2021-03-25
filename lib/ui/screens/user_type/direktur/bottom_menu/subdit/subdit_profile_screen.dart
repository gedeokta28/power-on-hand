import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/daftar_anggota_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/subdit_daftar_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/subdit_daftar_laporan_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/subdit_daftar_lp_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/subdit_daftar_paparan_screen.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/anggota_item_widget.dart';

class SubditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBottomMenu(
      children: [
        Padding(
          padding: EdgeInsets.all(paddingY * 2),
          child: ListBody(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: AnggotaItemWidget(),
              ),
              ButtonWithArrowWidget(
                text: 'Daftar Kasus',
                isFlex: true,
                color: Colors.white,
                onTap: () {
                  Get.to(() => SubditDaftarKasusScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Daftar Anggota',
                isFlex: true,
                color: Colors.white,
                onTap: () {
                  Get.to(() => DaftarAnggotaScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Daftar LP',
                isFlex: true,
                color: Colors.white,
                onTap: () {
                  Get.to(() => SubditDaftarLPScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Daftar Laporan Harian',
                isFlex: true,
                color: Colors.white,
                onTap: () {
                  Get.to(() => SubditDaftarLaporanScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Daftar Paparan',
                isFlex: true,
                color: Colors.white,
                onTap: () {
                  Get.to(() => SubditDaftarPaparanScreen());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
