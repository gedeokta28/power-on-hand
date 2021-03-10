import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_input_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_input_laporan_harian_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/bottom_sheet/kanit_statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_item_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_list_title_widget.dart';

class AnggotaDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseCommonDashboard(
      name: 'Hi, Prawira Bagus Pratama',
      children: [
        Container(
          constraints: BoxConstraints(minHeight: 330),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonWithArrowWidget(
                text: 'Input Kasus',
                onTap: () {
                  Get.to(() => AnggotaInputKasusScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Input Laporan Harian',
                onTap: () {
                  Get.to(() => AnggotaInputLaporanHarianScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Statistik Penilaian',
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
        SizedBox(height: sy(12)),
        Divider(),
        DashboardHistoryListTitleWidget(title: 'History Dokumen', date: '18 January 2020'),
        SizedBox(height: sy(24)),
        SizedBox(
          height: sy(200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              DashboardHistoryItemWidget(title: 'Nama Dokumen', onTap: () {}),
              DashboardHistoryItemWidget(title: 'Nama Dokumen', onTap: () {}),
              DashboardHistoryItemWidget(title: 'Nama Dokumen', onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
