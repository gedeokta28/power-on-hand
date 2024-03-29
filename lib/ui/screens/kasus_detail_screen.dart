import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/kasus_controller.dart';
import 'package:power_on_hand/core/utils/download_utils.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class KasusDetailScreen extends StatelessWidget {
  final int kasusId;
  KasusDetailScreen(this.kasusId);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KasusController>(
      initState: (_) => KasusController.to.getKasusDetail(kasusId),
      builder: (_) {
        if (_.kasusDetail == null || _.isLoading == true) {
          return Material(child: Center(child: CircularProgressIndicator()));
        }
        return BaseBottomMenu(
          title: 'Kasus Detail',
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingX),
              child: ListBody(
                children: [
                  Text(
                    'Kasus',
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
                    _.kasusDetail.userName ?? "",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Uraian Laporan',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.kasusDetail.description ?? "",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Dasar',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.kasusDetail.anvil ?? "",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Indentitas Terlapor',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.kasusDetail.idcard?.split('/')[2],
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  InkWell(
                    onTap: () async {
                      await DownloadUtils.download(baseURL + _.kasusDetail.idcard);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RoundedChipColor(
                        text: 'Lihat Foto Identitas',
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
                  Text(
                    _.kasusDetail.evidence?.split('/')[2],
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  InkWell(
                    onTap: () async {
                      await DownloadUtils.download(baseURL + _.kasusDetail.evidence);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RoundedChipColor(
                        text: 'Lihat Foto Barang Bukti',
                        color: Colors.red.shade700,
                        fontColor: Colors.white,
                        padding: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Motif',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.kasusDetail.persuasive ?? "",
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
                    _.kasusDetail.affairName ?? "",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Pasal',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.kasusDetail.provisionName ?? "",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Rencana Tindak Lanjut',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _.kasusDetail.plan,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
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
