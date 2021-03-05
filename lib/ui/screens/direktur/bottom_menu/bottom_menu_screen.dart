import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/grafik/dashboard_menu_item_widget.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class BottomMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldThreeTopCircleContainer(
      customPaddingX: 0,
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(paddingX, 0, paddingX, paddingX),
            child: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 16,
            ),
          ),
          Container(
            height: Get.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: sy(36),
                    height: sy(4),
                    margin: EdgeInsets.all(sy(8)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DashboardMenuItemWidget(title: 'Indagsi', widget: Icon(FontAwesomeIcons.industry)),
                      DashboardMenuItemWidget(title: 'Perbankan', widget: Icon(FontAwesomeIcons.university)),
                      DashboardMenuItemWidget(title: 'Tipidkor', widget: Icon(FontAwesomeIcons.handHoldingUsd)),
                      DashboardMenuItemWidget(title: 'Tipidter', widget: Icon(FontAwesomeIcons.recycle)),
                      DashboardMenuItemWidget(title: 'Siber', widget: Image.asset('assets/images/siber.png')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
