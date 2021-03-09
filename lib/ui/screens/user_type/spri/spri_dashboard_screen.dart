import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_lp_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/spri/spri_input_kegiatan_direktur_screen.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_item_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_list_title_widget.dart';

class SpriDashboardScreen extends StatelessWidget {
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
                text: 'Input Kegiatan Wadir',
                onTap: () {
                  Get.to(() => SpriInputKegiatanDirekturScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Input Kegiatan Tamu',
                onTap: () {
                  Get.to(() => KanitUploadLpScreen());
                },
              ),
            ],
          ),
        ),
        SizedBox(height: sy(12)),
        Divider(),
        DashboardHistoryListTitleWidget(title: 'History Tamu', date: '18 January 2020'),
        SizedBox(height: sy(24)),
        SizedBox(
          height: sy(200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              DashboardHistoryItemWidget(title: 'Nama Tamu', onTap: () {}),
              DashboardHistoryItemWidget(title: 'Kosmetik Palsu', onTap: () {}),
              DashboardHistoryItemWidget(title: 'Bisnis Bodong', onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
