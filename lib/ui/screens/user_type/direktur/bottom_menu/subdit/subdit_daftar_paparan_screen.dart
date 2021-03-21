import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/search_input_widget.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/subdit_daftar_item_widget.dart';

class SubditDaftarPaparanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBottomMenu(
      title: 'Daftar Paparan',
      children: [
        SearchInputWidget('Cari Paparan'),
        SubditDaftarItem(
          title: 'Nama Paparan',
          onTap: () {
            showToast('wip');
          },
        ),
        SubditDaftarItem(
          title: 'Nama Paparan',
          onTap: () {
            showToast('wip');
          },
        ),
        SubditDaftarItem(
          title: 'Nama Paparan',
          onTap: () {
            showToast('wip');
          },
        ),
        SubditDaftarItem(
          title: 'Nama Paparan',
          onTap: () {
            showToast('wip');
          },
        ),
      ],
    );
  }
}
