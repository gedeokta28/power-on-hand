import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/ui/screens/navigation_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/direktur_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/notification_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_laporan_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_paparan_screen.dart';
import 'package:power_on_hand/ui/widgets/grafik/anggota_item_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/dashboard_menu_item_widget.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class KasubditDashboardScreen extends StatelessWidget {
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
                InkWell(
                  onTap: () => Get.to(() => NavigationScreen()),
                  child: Icon(FontAwesomeIcons.alignLeft),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      Get.to(() => NotificationScreen());
                    },
                    child: Icon(FontAwesomeIcons.solidBell)),
              ],
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: Get.width / 1.5,
            child: GetBuilder<UserController>(
              builder: (_) {
                return Text(
                  'HI, Perwira ${_?.user?.name ?? ""}',
                  style: GoogleFonts.varelaRound(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 24),
          ChartDashboardWidgets(),
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF39FEC2),
                  Color(0xFFAF38FF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
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
                  SizedBox(height: 2),
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
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.chevronLeft,
                        size: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 150,
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
                      ),
                      Icon(
                        FontAwesomeIcons.chevronRight,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DashboardMenuItemWidget(
                      title: 'Upload Kasus',
                      onTap: () => Get.to(() => KanitUploadKasusScreen()),
                    ),
                    DashboardMenuItemWidget(
                      title: 'Upload LP',
                      onTap: () => Get.to(() => KanitUploadLaporanScreen()),
                    ),
                    DashboardMenuItemWidget(
                      title: 'Upload Paparan',
                      onTap: () => Get.to(() => KanitUploadPaparanScreen()),
                    ),
                    DashboardMenuItemWidget(
                      title: 'Aktivitas Anggota',
                      onTap: () {
                        // Get.bottomSheet(
                        //   StatistikPenilaianBottomSheet(),
                        //   isScrollControlled: true,
                        // );
                      },
                    ),
                    DashboardMenuItemWidget(
                      title: 'Statistik Penilaian',
                      onTap: () {
                        // Get.bottomSheet(
                        //   StatistikPenilaianBottomSheet(),
                        //   isScrollControlled: true,
                        // );
                      },
                    ),
                    DashboardMenuItemWidget(
                      title: 'Upload Paparan',
                      onTap: () => Get.to(() => KanitUploadPaparanScreen()),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
