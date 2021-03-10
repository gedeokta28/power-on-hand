import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/bottom_sheet/kanit_statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_lp_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_paparan_screen.dart';
import 'package:power_on_hand/ui/widgets/grafik/anggota_item_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/dashboard_menu_item_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/statistik_item_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/statistik_penilaian_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/grafik_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/indicator_widget.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class KasubditDashboardScreen extends StatelessWidget {
  final List<PieChartSectionData> kelaminChartList = [
    PieChartSectionData(
      color: const Color(0xff13d38e),
      value: 30,
      title: '30%',
      radius: 65,
      titleStyle: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xFFCF1F69),
      value: 40,
      title: '40%',
      radius: 65,
      titleStyle: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xff845bef),
      value: 30,
      title: '30%',
      radius: 65,
      titleStyle: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  ];

  final List<Indicator> kelaminIndicatorList = [
    Indicator(
      color: Color(0xff13d38e),
      text: 'Laporan Masuk',
    ),
    Indicator(
      color: Color(0xFFCF1F69),
      text: 'Laporan Terselesaikan',
    ),
    Indicator(
      color: Color(0xff845bef),
      text: 'Laporan Tidak Terselesaikan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldThreeTopCircleContainer(
      customPaddingX: Get.width * 0.02,
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(Get.width * 0.02),
            child: Row(
              children: [
                InkWell(onTap: Get.back, child: Icon(FontAwesomeIcons.alignLeft)),
                Spacer(),
                InkWell(onTap: Get.back, child: Icon(FontAwesomeIcons.solidBell)),
              ],
            ),
          ),
          SizedBox(height: sy(16)),
          SizedBox(
            width: Get.width / 1.5,
            child: Text(
              'Hi, Username',
              style: GoogleFonts.varelaRound(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: sy(24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatistikItemWidget(
                title: 'Statistik Penilaian',
                onTapLihat: () {
                  showToast('wip');
                },
                color: Color(0xFFF44771),
                chartWidget: StatistikPenilaianWidget(),
              ),
              StatistikItemWidget(
                title: 'Statistik Laporan',
                onTapLihat: () {
                  showToast('wip');
                },
                color: Color(0xFF9DFFE1),
                chartWidget: GrafikWidget(
                  indicatorList: kelaminIndicatorList,
                  pieChartList: kelaminChartList,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.zero,
            color: Color(0xFFFFD8D8),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, sy(8), 0, sy(8)),
              child: Column(
                children: [
                  Text(
                    'Daftar Anggota',
                    style: GoogleFonts.varelaRound(
                      fontSize: 12,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: sy(2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.chevronLeft,
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Unit II',
                          style: GoogleFonts.varelaRound(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.chevronRight,
                        size: 16,
                      ),
                    ],
                  ),
                  SizedBox(height: sy(4)),
                  SizedBox(
                    height: sy(130),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        AnggotaItemWidget(),
                        AnggotaItemWidget(),
                        AnggotaItemWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.zero,
            color: Color(0xFFFDE6FF),
            child: Padding(
              padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashboardMenuItemWidget(
                    title: 'Upload Kasus',
                    onTap: () => Get.to(() => KanitUploadKasusScreen()),
                  ),
                  DashboardMenuItemWidget(
                    title: 'Upload LP',
                    onTap: () => Get.to(() => KanitUploadLpScreen()),
                  ),
                  DashboardMenuItemWidget(
                    title: 'Upload Paparan',
                    onTap: () => Get.to(() => KanitUploadPaparanScreen()),
                  ),
                  DashboardMenuItemWidget(
                    title: 'Aktivitas Anggota',
                    onTap: () {
                      Get.bottomSheet(
                        KanitStatistikPenilaianBottomSheet(),
                        isScrollControlled: true,
                      );
                    },
                  ),
                  DashboardMenuItemWidget(
                    title: 'Statistik Penilaian',
                    onTap: () {
                      Get.bottomSheet(
                        KanitStatistikPenilaianBottomSheet(),
                        isScrollControlled: true,
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
