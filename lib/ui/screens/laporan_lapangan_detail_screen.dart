import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/laporan_harian_controller.dart';
import 'package:power_on_hand/core/utils/download_utils.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class LaporanLapanganDetailScreen extends StatelessWidget {
  final int laporanId;
  LaporanLapanganDetailScreen(this.laporanId);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaporanHarianController>(
      initState: (_) => LaporanHarianController.to.getLaporanDetail(laporanId),
      builder: (_) {
        if (_.laporanDetail == null || _.isLoading == true) {
          return Material(child: Center(child: CircularProgressIndicator()));
        }
        return BaseBottomMenu(
          title: 'Laporan Lapangan Detail',
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingX),
              child: ListBody(
                children: [
                  Text(
                    'Laporan Lapangan',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Penyidik',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.laporanDetail.id.toString(),
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Perkara',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.laporanDetail.affairName ?? "",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'TKP',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.laporanDetail.crimeScrene?.split('/')[3],
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  InkWell(
                    onTap: () async {
                      await DownloadUtils.download(baseURL + _.laporanDetail.crimeScrene);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RoundedChipColor(
                        text: 'Lihat TKP',
                        color: Colors.red.shade700,
                        fontColor: Colors.white,
                        padding: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Barang Bukti',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.laporanDetail.evidence?.split('/')[3],
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  InkWell(
                    onTap: () async {
                      await DownloadUtils.download(baseURL + _.laporanDetail.evidence);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RoundedChipColor(
                        text: 'Lihat Barang Bukti',
                        color: Colors.red.shade700,
                        fontColor: Colors.white,
                        padding: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Identitas Terlapor',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.laporanDetail.idCard?.split('/')[3],
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  InkWell(
                    onTap: () async {
                      await DownloadUtils.download(baseURL + _.laporanDetail.idCard);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RoundedChipColor(
                        text: 'Lihat Identitas',
                        color: Colors.red.shade700,
                        fontColor: Colors.white,
                        padding: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Foto Sidik Jari',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.laporanDetail.evidence?.split('/')[3],
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  InkWell(
                    onTap: () async {
                      await DownloadUtils.download(baseURL + _.laporanDetail.fingerprint);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RoundedChipColor(
                        text: 'Lihat Sidik Jari',
                        color: Colors.red.shade700,
                        fontColor: Colors.white,
                        padding: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
