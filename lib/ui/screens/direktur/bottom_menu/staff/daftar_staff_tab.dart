import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/direktur/bottom_menu/menu_item_long_grey_widget.dart';
import 'package:power_on_hand/ui/screens/direktur/bottom_menu/menu_title_widget.dart';
import 'package:power_on_hand/ui/screens/direktur/bottom_menu/staff/bag_wassidik.dart';

class DaftarStaffTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuTitleWidget(title: 'BAG WASSIDIK'),
          Padding(
            padding: EdgeInsets.fromLTRB(paddingX, 0, 0, 8),
            child: MenuItemLongGreyWidget(
              title: 'WASSIDIK',
              onTap: () {
                Get.to(() => BagWassidik());
              },
            ),
          ),
          MenuTitleWidget(title: 'BAG BINOPS'),
          Padding(
            padding: EdgeInsets.fromLTRB(paddingX, 0, 0, 8),
            child: MenuItemLongGreyWidget(
              title: 'BINOPS',
              onTap: () {
                Get.to(() => BagBinops());
              },
            ),
          ),
          MenuTitleWidget(title: 'BAG RENMIN'),
          Padding(
            padding: EdgeInsets.fromLTRB(paddingX, 0, 0, 8),
            child: MenuItemLongGreyWidget(
              title: 'RENMIN',
              onTap: () {
                Get.to(() => BagRenmin());
              },
            ),
          ),
          MenuTitleWidget(title: 'BAG KORWAS'),
          Padding(
            padding: EdgeInsets.fromLTRB(paddingX, 0, 0, 8),
            child: MenuItemLongGreyWidget(
              title: 'KORWAS',
              onTap: () {
                Get.to(() => BagKorwas());
              },
            ),
          ),
        ],
      ),
    );
  }
}
