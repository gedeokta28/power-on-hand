import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/dashboard_kasus_history_widget.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_laporan_harian_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_laporan_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_paparan_screen.dart';
import 'package:power_on_hand/ui/widgets/bottom_sheet/statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';

class KanitDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseCommonDashboard(
      name: 'Hi, Prawira Bagus Pratama',
      children: [
        Container(
          constraints: BoxConstraints(minHeight: 330),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWithArrowWidget(
                text: 'Upload Laporan',
                onTap: () {
                  Get.to(() => KanitUploadLaporanScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Upload Paparan',
                onTap: () {
                  Get.to(() => KanitUploadPaparanScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Upload Kasus',
                onTap: () {
                  Get.to(() => KanitUploadKasusScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Upload Laporan Lapangan',
                onTap: () {
                  Get.to(() => KanitUploadLaporanHarianScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Statitik Penilaian',
                onTap: () {
                  Get.bottomSheet(
                    StatistikPenilaianBottomSheet(),
                    isScrollControlled: true,
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: sy(12)),
        Divider(),
        DashboardKasusHistoryWidget(),
      ],
    );
  }
}
