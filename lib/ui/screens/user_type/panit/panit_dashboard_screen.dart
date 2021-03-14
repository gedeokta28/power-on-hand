import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/bottom_sheet/kanit_statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/screens/user_type/panit/panit_upload_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/panit/panit_upload_lp_screen.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_item_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_list_title_widget.dart';

class PanitDashboardScreen extends StatelessWidget {
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
                text: 'Upload Kasus',
                onTap: () {
                  Get.to(() => PanitUploadKasusScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Upload Laporan Harian',
                onTap: () {
                  Get.to(() => PanitUploadLpScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Statitik Penilaian',
                onTap: () {
                  Get.bottomSheet(
                    KanitStatistikPenilaianBottomSheet(),
                    isScrollControlled: true,
                  );
                },
              ),
              ButtonWithArrowWidget(
                text: 'Upload LP',
                onTap: () {
                  Get.to(() => PanitUploadLpScreen());
                },
              ),
            ],
          ),
        ),
        SizedBox(height: sy(12)),
        Divider(),
        DashboardHistoryListTitleWidget(title: 'History Kasus', date: '18 January 2020'),
        SizedBox(height: sy(24)),
        SizedBox(
          height: sy(200),
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
    );
  }
}
