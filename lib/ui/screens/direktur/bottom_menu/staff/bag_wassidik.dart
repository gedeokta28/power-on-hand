import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/direktur/bottom_menu/menu_item_long_grey_widget.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

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
          MenuItemLongGreyWidget(title: 'Subdit I'),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(title: 'Subdit II'),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(title: 'Subdit III'),
          SizedBox(height: 8),
          MenuItemLongGreyWidget(title: 'Subdit IV'),
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
    return ScaffoldThreeTopCircleContainer(
      customPaddingX: 0,
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: Get.back,
            child: Padding(
              padding: EdgeInsets.fromLTRB(paddingX, 0, paddingX, paddingY),
              child: Icon(
                FontAwesomeIcons.chevronLeft,
                size: 16,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(minHeight: Get.height - 200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(paddingX, paddingY, paddingX, 8),
                  child: InkWell(
                    onTap: Get.back,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: sy(36),
                        height: sy(4),
                        margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
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
            ),
          ),
        ],
      ),
    );
  }
}
