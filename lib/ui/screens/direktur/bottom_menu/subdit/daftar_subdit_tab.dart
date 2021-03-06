import 'package:flutter/material.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/direktur/bottom_menu/menu_item_long_grey_widget.dart';
import 'package:power_on_hand/ui/screens/direktur/bottom_menu/menu_title_widget.dart';

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
                MenuItemLongGreyWidget(title: 'Unit I', subtitle: 'INDAGSI'),
                MenuItemLongGreyWidget(title: 'Unit II', subtitle: 'INDAGSI'),
                MenuItemLongGreyWidget(title: 'Unit III', subtitle: 'INDAGSI'),
                MenuItemLongGreyWidget(title: 'Unit IV', subtitle: 'INDAGSI'),
              ],
            ),
          ),
          MenuTitleWidget(title: 'Subdit II'),
          Padding(
            padding: EdgeInsets.fromLTRB(paddingX, 0, 0, paddingX),
            child: Column(
              children: [
                MenuItemLongGreyWidget(title: 'Unit I', subtitle: 'PERBANKAN'),
                MenuItemLongGreyWidget(title: 'Unit II', subtitle: 'PERBANKAN'),
                MenuItemLongGreyWidget(title: 'Unit III', subtitle: 'PERBANKAN'),
                MenuItemLongGreyWidget(title: 'Unit IV', subtitle: 'PERBANKAN'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
