import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/screens/direktur/bottom_menu/menu_item_long_grey_widget.dart';
import 'package:power_on_hand/ui/screens/direktur/bottom_menu/staff/wassidik/gelar_perkara.dart';

class BagKorwas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseStaffScreen(
      title: 'BAG KORWAS',
      child: Column(
        children: [
          SizedBox(height: sy(50)),
          MenuItemLongGreyWidget(title: 'Daftar Kasus'),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(title: 'Daftar Lp'),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(title: 'Daftar Paparan'),
        ],
      ),
    );
  }
}

class BagRenmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseStaffScreen(
      title: 'BAG RENMIN',
      child: Column(
        children: [
          SizedBox(height: sy(50)),
          MenuItemLongGreyWidget(title: 'Surat Keluar'),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(title: 'Surat Masuk'),
        ],
      ),
    );
  }
}

class BagBinops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseStaffScreen(
      title: 'BAG BINOPS',
      child: Column(
        children: [
          SizedBox(height: sy(50)),
          MenuItemLongGreyWidget(title: 'Satgas Pangan'),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(title: 'Satgas Pemulihan Ekonomi Nasional'),
        ],
      ),
    );
  }
}

class BagWassidik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseStaffScreen(
      title: 'BAG WASSIDIK',
      child: Column(
        children: [
          MenuItemLongGreyWidget(
            title: 'Subdit I',
            onTap: () {
              Get.to(() => GelarPerkara());
            },
          ),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(
            title: 'Subdit II',
            onTap: () {
              Get.to(() => GelarPerkara());
            },
          ),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(
            title: 'Subdit III',
            onTap: () {
              Get.to(() => GelarPerkara());
            },
          ),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(
            title: 'Subdit IV',
            onTap: () {
              Get.to(() => GelarPerkara());
            },
          ),
        ],
      ),
    );
  }
}

class BaseStaffScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const BaseStaffScreen({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBottomMenu(
      children: [
        Container(
          width: Get.width / 2 - 10,
          margin: EdgeInsets.only(bottom: 4),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.grey.shade400,
          ),
          child: Text(
            title,
            style: GoogleFonts.varelaRound(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingX, 0, 0, paddingX),
          child: child,
        ),
      ],
    );
  }
}
