import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/controllers/anggota_controller.dart';
import 'package:power_on_hand/core/models/laporan_model.dart';

class LaporanListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Daftar Laporan',
            style: GoogleFonts.varelaRound(),
          ),
        ),
        body: Container(
          height: double.infinity,
          child: GetBuilder<AnggotaController>(
            autoRemove: false,
            builder: (_) {
              if (_.listLaporan == null) {
                _.getLaporanList();
                return Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(height: 1),
                physics: BouncingScrollPhysics(),
                itemCount: _.listLaporan.length,
                itemBuilder: (context, index) {
                  LaporanModel laporan = _.listLaporan[index];
                  return ListTile(
                    onTap: () {
                      // return affair chosen
                      Get.back(result: laporan);
                    },
                    dense: true,
                    title: Text(
                      laporan.id.toString(),
                      style: GoogleFonts.varelaRound(fontSize: 14),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
