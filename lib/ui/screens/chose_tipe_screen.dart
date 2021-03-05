import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_common_dashboard.dart';
import 'package:power_on_hand/ui/screens/direktur/direktur_dashboard_screen.dart';
import 'package:power_on_hand/ui/screens/kasubdit/dashboard/kasubdit_dashboard_screen.dart';

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
            title: Text('Kadit'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
            onTap: () {
              Get.to(() => BaseCommonDashboard());
            },
          ),
        ],
      ),
    );
  }
}
