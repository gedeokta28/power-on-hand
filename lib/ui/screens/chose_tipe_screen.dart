import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/anggota_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/direktur_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/kasubdit/dashboard/kasubdit_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/panit/panit_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/renmin/renmin_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/satgas_pangan_binops/satgas_pangan_binops_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/satgas_pen_binops/satgas_pen_binops_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/spri/spri_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/wassidik/wassidik_dashboard_screen.dart';

class ChooseTipeScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilih Tipe User')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Direktur'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => DirekturDashboardScreen());
            },
          ),
          ListTile(
            title: Text('Kasubdit'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => KasubditDashboardScreen());
            },
          ),
          ListTile(
            title: Text('Kanit'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => KanitDashboardScreen());
            },
          ),
          ListTile(
            title: Text('Panit'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => PanitDashboardScreen());
            },
          ),
          ListTile(
            title: Text('SPRI'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => SpriDashboardScreen());
            },
          ),
          ListTile(
            title: Text('Satgas PEN - BINOPS'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => SatgasPenBinopsDashboardScreen());
            },
          ),
          ListTile(
            title: Text('BAG WASIDIK'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => WassidikDashboardScreen());
            },
          ),
          ListTile(
            title: Text('Anggota'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => AnggotaDashboardScreen());
            },
          ),
          ListTile(
            title: Text('Satgas PANGAN - BINOPS'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => SatgasPanganBinopsDashboardScreen());
            },
          ),
          ListTile(
            title: Text('Renmin'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => RenminDashboardScreen());
            },
          ),
        ],
      ),
    );
  }
}
