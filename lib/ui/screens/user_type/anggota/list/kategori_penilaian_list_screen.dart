import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 14, 8, 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: TextField(
                        autofocus: false,
                        onChanged: (value) {
                          AnggotaController.to.searchKategoriPenilaian(value);
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Cari Kategori',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                    child: Icon(FontAwesomeIcons.search, size: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
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
                            // clean search
                            AnggotaController.to.searchKategoriPenilaian('');
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
          ],
        ),
      ),
    );
  }
}
