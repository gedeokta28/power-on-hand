import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/search_input_widget.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/subdit_daftar_item_widget.dart';

class SubditDaftarLPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBottomMenu(
      title: 'Daftar LP',
      children: [
        SearchInputWidget('Cari LP'),
        SubditDaftarItem(
          title: 'LP-1.docx',
          penyidik: 'Panit: Ipda Angga Saputra',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            showToast('wip');
          },
        ),
        SubditDaftarItem(
          title: 'LP-1.docx',
          penyidik: 'Panit: Ipda Angga Saputra',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            showToast('wip');
          },
        ),
        SubditDaftarItem(
          title: 'LP-1.docx',
          penyidik: 'Panit: Ipda Angga Saputra',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            showToast('wip');
          },
        ),
        SubditDaftarItem(
          title: 'LP-1.docx',
          penyidik: 'Panit: Ipda Angga Saputra',
          subtitle: 'Pencemaran Nama Baik',
          onTap: () {
            showToast('wip');
          },
        ),
      ],
    );
  }
}
