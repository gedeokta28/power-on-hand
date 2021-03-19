import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/anggota_controller.dart';
import 'package:power_on_hand/core/utils/helper_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_input_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_input_laporan_harian_screen.dart';
import 'package:power_on_hand/ui/widgets/bottom_sheet/statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_item_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_list_title_widget.dart';

class AnggotaDashboardScreen extends StatefulWidget {
  @override
  _AnggotaDashboardScreenState createState() => _AnggotaDashboardScreenState();
}

class _AnggotaDashboardScreenState extends State<AnggotaDashboardScreen> {
  String choosenDate = "";

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
          title: 'History Dokumen',
          date: choosenDate.isNotEmpty ? choosenDate : DateFormat("dd MMMM yyyy").format(DateTime.now()),
          onTapDate: () async {
            var res = await HelperUtils.getDatePicker();
            if (res != null) {
              setState(() {
                choosenDate = DateFormat("dd MMMM yyyy").format(res);
              });
              AnggotaController.to.getKasusHistoryList(date: res);
            }
          },
        ),
        SizedBox(height: 24),
        GetBuilder<AnggotaController>(
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
