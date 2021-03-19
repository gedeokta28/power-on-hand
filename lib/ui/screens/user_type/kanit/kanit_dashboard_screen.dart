import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/kanit_controller.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/bottom_sheet/kanit_statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_lp_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_paparan_screen.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_item_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_list_title_widget.dart';

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
            ],
          ),
        ),
        SizedBox(height: sy(12)),
        Divider(),
        DashboardHistoryListTitleWidget(title: 'History Kasus', date: '18 January 2020'),
        SizedBox(height: sy(24)),
        GetBuilder<KanitController>(
          builder: (_) {
            return SizedBox(
              height: 200,
              child: _.listKasusHistory == null || _.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _.listKasusHistory.isEmpty
                      ? Center(
                          child: Text('No history found '),
                        )
                      : ListView.separated(
                          separatorBuilder: (_, __) => Divider(height: 1),
                          itemCount: _.listKasusHistory.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return DashboardHistoryItemWidget(
                              title: _.listKasusHistory[index].description,
                              onTap: () {
                                showToast('under construction');
                              },
                            );
                          },
                        ),
            );
          },
        ),
      ],
    );
  }
}
