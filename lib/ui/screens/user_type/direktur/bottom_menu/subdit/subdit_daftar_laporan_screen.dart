import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/search_input_widget.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/laporan_detail_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/subdit_daftar_item_widget.dart';

class SubditDaftarLaporanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBottomMenu(
      title: 'Daftar Laporan',
      children: [
        SearchInputWidget('Cari Laporan'),
        SubditDaftarItem(
          title: 'Laporan Lapangan-01',
          penyidik: 'Brigadi Angga Saputra ',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            Get.to(() => LaporanDetailScreen());
          },
        ),
        SubditDaftarItem(
          title: 'Laporan Lapangan-01',
          penyidik: 'Brigadi Angga Saputra ',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            Get.to(() => LaporanDetailScreen());
          },
        ),
        SubditDaftarItem(
          title: 'Laporan Lapangan-01',
          penyidik: 'Brigadi Angga Saputra ',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            Get.to(() => LaporanDetailScreen());
          },
        ),
        SubditDaftarItem(
          title: 'Laporan Lapangan-01',
          penyidik: 'Brigadi Angga Saputra ',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            Get.to(() => LaporanDetailScreen());
          },
        ),
      ],
    );
  }
}
