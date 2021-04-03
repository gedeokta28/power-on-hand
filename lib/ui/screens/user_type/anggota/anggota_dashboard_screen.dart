import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/dashboard_kasus_history_widget.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_input_giat_pengaman_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_input_kasus_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_input_laporan_harian_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_upload_penilaian_lapangan_screen.dart';
import 'package:power_on_hand/ui/widgets/bottom_sheet/statistik_penilaian_bottom_sheet.dart';
import 'package:power_on_hand/ui/widgets/dashboard/button_with_arrow_widget.dart';

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
                text: 'Input Laporan Lapangan',
                onTap: () {
                  Get.to(() => AnggotaInputLaporanHarianScreen());
                },
              ),
              ButtonWithArrowWidget(
                text: 'Input Giat Pengaman (PAM)',
                onTap: () {
                  Get.to(() => AnggotaInputGiatPengamanScreen());
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
              ButtonWithArrowWidget(
                text: 'Penilaian Penyidikan dan Penyelidikan',
                onTap: () {
                  Get.to(() => AnggotaUploadPenilainLapanganScreen());
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
