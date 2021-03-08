import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/staff/daftar_staff_tab.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/subdit/daftar_subdit_tab.dart';
import 'package:power_on_hand/ui/widgets/grafik/dashboard_menu_item_widget.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class BottomMenuScreen extends StatefulWidget {
  @override
  _BottomMenuScreenState createState() => _BottomMenuScreenState();
}

class _BottomMenuScreenState extends State<BottomMenuScreen> {
  bool isSwitchSubdit = true;
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(paddingX, paddingY, paddingX, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
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
                  isSwitchSubdit ? SubditTopMenu() : StaffTopMenu(),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        isSwitchSubdit ? 'Daftar Subdit' : 'Daftar Staff',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.varelaRound(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: isSwitchSubdit,
                        onChanged: (val) {
                          setState(() {
                            isSwitchSubdit = val;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isSwitchSubdit ? DaftarSubditTab() : DaftarStaffTab(),
        ],
      ),
    );
  }
}

class SubditTopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DashboardMenuItemWidget(title: 'Indagsi', widget: Icon(FontAwesomeIcons.industry)),
        DashboardMenuItemWidget(title: 'Perbankan', widget: Icon(FontAwesomeIcons.university)),
        DashboardMenuItemWidget(title: 'Tipidkor', widget: Icon(FontAwesomeIcons.handHoldingUsd)),
        DashboardMenuItemWidget(title: 'Tipidter', widget: Icon(FontAwesomeIcons.recycle)),
        DashboardMenuItemWidget(title: 'Siber', widget: Image.asset('assets/images/siber.png')),
      ],
    );
  }
}

class StaffTopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DashboardMenuItemWidget(title: 'Renmin', widget: Icon(FontAwesomeIcons.industry)),
        DashboardMenuItemWidget(title: 'Wasidik', widget: Icon(FontAwesomeIcons.university)),
        DashboardMenuItemWidget(title: 'Bin Ops', widget: Icon(FontAwesomeIcons.handHoldingUsd)),
        DashboardMenuItemWidget(title: 'Korwas', widget: Icon(FontAwesomeIcons.recycle)),
      ],
    );
  }
}
