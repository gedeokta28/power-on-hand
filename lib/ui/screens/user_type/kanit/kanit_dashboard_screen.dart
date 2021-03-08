import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/bottom_sheet/kanit_statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_lp_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_paparan_screen.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_item_widget.dart';

class KanitDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseCommonDashboard(
      name: 'Hi, Prawira Bagus Pratama',
      children: [
        ButtonWithArrowWidget(
          text: 'Upload Kasus',
          onTap: () {
            Get.to(() => KanitUploadKasusScreen());
          },
        ),
        ButtonWithArrowWidget(
          text: 'Upload Laporan Harian',
          onTap: () {
            Get.to(() => KanitUploadLpScreen());
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
            Get.to(() => KanitUploadPaparanScreen());
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
          height: sy(200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              DashboardHistoryItemWidget(title: 'Judi Online', onTap: () {}),
              DashboardHistoryItemWidget(title: 'Kosmetik Palsu', onTap: () {}),
              DashboardHistoryItemWidget(title: 'Bisnis Bodong', onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
