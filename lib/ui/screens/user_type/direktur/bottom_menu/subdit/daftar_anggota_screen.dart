import 'package:flutter/material.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/widgets/grafik/anggota_item_widget.dart';

class DaftarAnggotaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBottomMenu(
      title: 'Daftar Anggota',
      children: [
        Padding(
          padding: EdgeInsets.all(paddingY * 2),
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: AnggotaItemWidget(),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: AnggotaItemWidget(),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: AnggotaItemWidget(),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: AnggotaItemWidget(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
