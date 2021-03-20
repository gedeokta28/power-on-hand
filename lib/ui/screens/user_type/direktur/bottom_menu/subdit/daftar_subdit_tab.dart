import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/menu_item_long_grey_widget.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/menu_title_widget.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/subdit_profile_screen.dart';

class DaftarSubditTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuTitleWidget(title: 'Subdit I'),
          Padding(
            padding: EdgeInsets.fromLTRB(paddingX, 0, 0, paddingX),
            child: Column(
              children: [
                MenuItemLongGreyWidget(
                  title: 'Unit I',
                  subtitle: 'INDAGSI',
                  onTap: () {
                    Get.to(() => SubditProfileScreen());
                  },
                ),
                MenuItemLongGreyWidget(
                  title: 'Unit II',
                  subtitle: 'INDAGSI',
                  onTap: () {
                    Get.to(() => SubditProfileScreen());
                  },
                ),
                MenuItemLongGreyWidget(
                  title: 'Unit III',
                  subtitle: 'INDAGSI',
                  onTap: () {
                    Get.to(() => SubditProfileScreen());
                  },
                ),
                MenuItemLongGreyWidget(
                  title: 'Unit IV',
                  subtitle: 'INDAGSI',
                  onTap: () {
                    Get.to(() => SubditProfileScreen());
                  },
                ),
              ],
            ),
          ),
          MenuTitleWidget(title: 'Subdit II'),
          Padding(
            padding: EdgeInsets.fromLTRB(paddingX, 0, 0, paddingX),
            child: Column(
              children: [
                MenuItemLongGreyWidget(
                  title: 'Unit I',
                  subtitle: 'PERBANKAN',
                  onTap: () {
                    Get.to(() => SubditProfileScreen());
                  },
                ),
                MenuItemLongGreyWidget(
                  title: 'Unit II',
                  subtitle: 'PERBANKAN',
                  onTap: () {
                    Get.to(() => SubditProfileScreen());
                  },
                ),
                MenuItemLongGreyWidget(
                  title: 'Unit III',
                  subtitle: 'PERBANKAN',
                  onTap: () {
                    Get.to(() => SubditProfileScreen());
                  },
                ),
                MenuItemLongGreyWidget(
                  title: 'Unit IV',
                  subtitle: 'PERBANKAN',
                  onTap: () {
                    Get.to(() => SubditProfileScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
