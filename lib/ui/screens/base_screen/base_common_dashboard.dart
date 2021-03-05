import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/kanit/bottom_sheet/kanit_statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/screens/kanit/kanit_upload_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/kanit/kanit_upload_lp_screen.dart';
import 'package:power_on_hand/ui/screens/kasubdit/dashboard/kasubdit_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/spri/spri_input_kegiatan_direktur_screen.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_item_widget.dart';

class BaseCommonDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Blue Circle
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFFC2424), Color(0xFF9D7AFF)],
                    ),
                  ),
                ),
              ),
              // Police Standing Image
              Positioned(
                top: sy(105),
                right: sx(10),
                child: Image(
                  image: AssetImage('assets/images/police_standing.png'),
                  height: Get.height / 1.6,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(onTap: Get.back, child: Icon(FontAwesomeIcons.signOutAlt)),
                        Spacer(),
                        InkWell(onTap: Get.back, child: Icon(FontAwesomeIcons.ellipsisV)),
                      ],
                    ),
                    SizedBox(height: sy(22)),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: Text(
                        'Hi, Prawira Bagus Pratama',
                        style: GoogleFonts.varelaRound(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Chip(
                      backgroundColor: Color(0xFF4DB4FF),
                      visualDensity: VisualDensity.compact,
                      label: Text(
                        'Dinas',
                        style: GoogleFonts.varelaRound(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      labelPadding: EdgeInsets.only(right: 4),
                      avatar: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent[400],
                          borderRadius: BorderRadius.circular(180),
                        ),
                      ),
                    ),
                    SizedBox(height: sy(28)),
                    ButtonWithArrowWidget(
                      text: 'Upload Kasus',
                      onTap: () {
                        Get.to(() => KanitUploadKasusScreen());
                      },
                    ),
                    ButtonWithArrowWidget(
                      text: 'Dashboard Kasubdit',
                      onTap: () {
                        Get.to(() => KasubditDashboardScreen());
                      },
                    ),
                    ButtonWithArrowWidget(
                      text: 'Statitik Penilaian',
                      onTap: () {
                        Get.bottomSheet(
                          KanitStatistikPenilaianBottomSheet(),
                          isScrollControlled: true,
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        );
                      },
                    ),
                    ButtonWithArrowWidget(
                      text: 'Upload LP',
                      onTap: () {
                        Get.to(() => KanitUploadLpScreen());
                      },
                    ),
                    ButtonWithArrowWidget(
                      text: 'Upload Paparan',
                      onTap: () {
                        Get.to(() => SpriInputKegiatanDirekturScreen());
                      },
                    ),
                    SizedBox(height: sy(12)),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          'History Kasus',
                          style: GoogleFonts.varelaRound(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF353E6C),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4, right: 4),
                          child: Icon(
                            FontAwesomeIcons.calendarAlt,
                            size: 14,
                            color: Color(0xFFBACCFD),
                          ),
                        ),
                        Text(
                          '18 January 2020',
                          style: GoogleFonts.varelaRound(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFBACCFD),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: sy(24)),
                    SizedBox(
                      height: sy(210),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          DashboardHistoryItemWidget(title: 'Judi Online', onTap: () {}),
                          DashboardHistoryItemWidget(title: 'Kosmetik Palsu', onTap: () {}),
                          DashboardHistoryItemWidget(title: 'Bisnis Bodong', onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
