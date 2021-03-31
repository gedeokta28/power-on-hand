import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/models/kasus_model.dart';
import 'package:power_on_hand/core/utils/download_utils.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class KasusDetailScreen extends StatelessWidget {
  final KasusModel kasus;
  KasusDetailScreen(this.kasus);

  @override
  Widget build(BuildContext context) {
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
                'Brigadir Bagas Dermawan',
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
                kasus.description ?? "",
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
                kasus.anvil ?? "",
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
                kasus.idcard?.split('/')[2],
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              InkWell(
                onTap: () async {
                  await DownloadUtils.download(baseURL + kasus.idcard);
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
                kasus.evidence?.split('/')[2],
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              InkWell(
                onTap: () async {
                  await DownloadUtils.download(baseURL + kasus.evidence);
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
                kasus.persuasive ?? "",
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
                kasus.affairId ?? "",
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
                kasus.provisionId ?? "",
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
                kasus.plan,
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
  }
}
