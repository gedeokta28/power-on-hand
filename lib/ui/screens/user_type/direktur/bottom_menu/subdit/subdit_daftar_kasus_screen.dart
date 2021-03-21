import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/kasus_detail_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/search_input_widget.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/subdit_daftar_item_widget.dart';

class SubditDaftarKasusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBottomMenu(
      title: 'Daftar Kasus',
      children: [
        SearchInputWidget('Cari Kasus'),
        SubditDaftarItem(
          title: 'Kasus-01',
          penyidik: 'Panit: Brigadi Angga Saputra',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            Get.to(() => KasusDetailScreen());
          },
        ),
        SubditDaftarItem(
          title: 'Kasus-01',
          penyidik: 'Panit: Brigadi Angga Saputra',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            Get.to(() => KasusDetailScreen());
          },
        ),
        SubditDaftarItem(
          title: 'Kasus-01',
          penyidik: 'Panit: Brigadi Angga Saputra',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            Get.to(() => KasusDetailScreen());
          },
        ),
        SubditDaftarItem(
          title: 'Kasus-01',
          penyidik: 'Panit: Brigadi Angga Saputra',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            Get.to(() => KasusDetailScreen());
          },
        ),
      ],
    );
  }
}
