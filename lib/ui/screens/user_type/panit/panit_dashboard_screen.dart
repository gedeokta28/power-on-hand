import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/kasus_controller.dart';
import 'package:power_on_hand/core/utils/helper_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/kasus_detail_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/panit/panit_upload_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/panit/panit_upload_laporan_harian_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/panit/panit_upload_laporan_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/panit/panit_upload_paparan_screen.dart';
import 'package:power_on_hand/ui/widgets/bottom_sheet/statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_item_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_list_title_widget.dart';

class PanitDashboardScreen extends StatefulWidget {
  @override
  _PanitDashboardScreenState createState() => _PanitDashboardScreenState();
}

class _PanitDashboardScreenState extends State<PanitDashboardScreen> {
  String choosenDate = "";

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
                  Get.to(() => PanitUploadLaporanScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Upload Paparan',
                onTap: () {
                  Get.to(() => PanitUploadPaparanScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Upload Kasus',
                onTap: () {
                  Get.to(() => PanitUploadKasusScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Upload Laporan Lapangan',
                onTap: () {
                  Get.to(() => PanitUploadLaporanHarianScreen());
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
        DashboardHistoryListTitleWidget(
          title: 'History Kasus',
          date: choosenDate.isNotEmpty ? choosenDate : DateFormat("dd MMMM yyyy").format(DateTime.now()),
          onTapDate: () async {
            var res = await HelperUtils.getDatePicker();
            if (res != null) {
              setState(() {
                choosenDate = DateFormat("dd MMMM yyyy").format(res);
              });
              KasusController.to.getKasusHistoryList(date: res);
            }
          },
        ),
        SizedBox(height: 24),
        GetBuilder<KasusController>(
          builder: (_) {
            if (_.listKasusHistory == null || _.isLoading == true) {
              return Center(child: CircularProgressIndicator());
            }
            return SizedBox(
              height: 200,
              child: _.listKasusHistory.isEmpty
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
                            Get.to(() => KasusDetailScreen(_.listKasusHistory[index]));
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
