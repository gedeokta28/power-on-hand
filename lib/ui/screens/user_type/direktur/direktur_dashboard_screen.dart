import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/controllers/chart_controller.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/bottom_menu_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/notification_screen.dart';
import 'package:power_on_hand/ui/widgets/grafik/anggota_item_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/dashboard_menu_item_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/grafik_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/statistik_item_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/statistik_penilaian_widget.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class DirekturDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (direkturCont) {
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
                    onTap: () {
                      UserController.to.logout();
                    },
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
                    'Hi, Perwira ${_?.user?.name ?? ""}',
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
            AnggotaDashboardWidget(),
            SizedBox(height: 12),
            BottomMenuDashboardWidget()
          ],
        ),
      );
    });
  }
}

class BottomMenuDashboardWidget extends StatelessWidget {
  const BottomMenuDashboardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => BottomMenuScreen(), transition: Transition.downToUp);
      },
      onVerticalDragStart: (e) {
        Get.to(() => BottomMenuScreen(), transition: Transition.downToUp);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.zero,
        color: Color(0xFFFDE6FF),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 36,
                height: 4,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashboardMenuItemWidget(title: 'Indagsi', widget: Icon(FontAwesomeIcons.industry)),
                  DashboardMenuItemWidget(title: 'Perbankan', widget: Icon(FontAwesomeIcons.university)),
                  DashboardMenuItemWidget(title: 'Tipidkor', widget: Icon(FontAwesomeIcons.handHoldingUsd)),
                  DashboardMenuItemWidget(title: 'Tipidter', widget: Icon(FontAwesomeIcons.recycle)),
                  DashboardMenuItemWidget(title: 'Siber', widget: Image.asset('assets/images/siber.png')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnggotaDashboardWidget extends StatelessWidget {
  const AnggotaDashboardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
      color: Color(0xFFFFD8D8),
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
            Container(
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
          ],
        ),
      ),
    );
  }
}

class ChartDashboardWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartController>(
      builder: (chartCont) {
        if (chartCont.listValuationChart == null || chartCont.listReportChart == null) {
          return Center(child: CircularProgressIndicator());
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StatistikItemWidget(
              title: 'Statistik Penilaian',
              onTapLihat: () {
                showToast('wip');
              },
              color: Color(0xFFF44771),
              chartWidget: StatistikPenilaianWidget(
                listStatistik: chartCont.listValuationChart,
              ),
            ),
            StatistikItemWidget(
              title: 'Statistik Laporan',
              onTapLihat: () {
                showToast('wip');
              },
              color: Color(0xFF9DFFE1),
              chartWidget: GrafikWidget(
                listReport: chartCont.listReportChart,
              ),
            ),
          ],
        );
      },
    );
  }
}
