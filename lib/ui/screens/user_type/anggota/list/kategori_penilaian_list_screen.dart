import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/controllers/anggota_controller.dart';
import 'package:power_on_hand/core/models/kategori_penilaian_model.dart';

class KategoriPenilaianListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Daftar Kategori Penilaian ',
            style: GoogleFonts.varelaRound(),
          ),
        ),
        body: Container(
          height: double.infinity,
          child: GetBuilder<AnggotaController>(
            autoRemove: false,
            builder: (_) {
              if (_.listKategoriPenilaian == null) {
                _.getKategoriPenilaianList();
                return Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(height: 1),
                physics: BouncingScrollPhysics(),
                itemCount: _.listKategoriPenilaian.length,
                itemBuilder: (context, index) {
                  KategoriPenilaianModel kategori = _.listKategoriPenilaian[index];
                  return ListTile(
                    onTap: () {
                      // return affair chosen
                      Get.back(result: kategori);
                    },
                    dense: true,
                    title: Text(
                      kategori.description,
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
