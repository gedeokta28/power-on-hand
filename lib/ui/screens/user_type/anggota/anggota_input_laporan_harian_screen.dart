import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class AnggotaInputLaporanHarianScreen extends StatefulWidget {
  @override
  _AnggotaInputLaporanHarianScreenState createState() => _AnggotaInputLaporanHarianScreenState();
}

class _AnggotaInputLaporanHarianScreenState extends State<AnggotaInputLaporanHarianScreen> {
  PlatformFile pfileLaporanHarian;
  TextEditingController cLaporanHarian = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input Laporan Harian',
      buttonText: 'Upload',
      buttonOnTap: () {
        showToast('wip');
      },
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAndChipWidget(
            text: 'Kepada',
            textChip: 'Panit',
          ),
          TextAndChipWidget(
            text: 'Dari',
            textChip: 'Penyidik',
          ),
          TextFieldWidget(
            title: 'Nama TSK',
          ),
          TextFieldWidget(
            title: 'Perkara',
          ),
          TextFieldWidget.file(
            title: 'TKP',
          ),
          TextFieldWidget.file(
            title: 'Barang Bukti',
          ),
          SizedBox(height: 8),
          Text(
            'Identitas Pelapor',
            style: GoogleFonts.varelaRound(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFieldWidget.file(
            hintText: 'KTP/SIM/KARTU PELAJAR',
          ),
          TextFieldWidget.file(
            hintText: 'FOTO SIDIK JARI',
          ),
          SizedBox(height: sy(28)),
          PrimaryButton(
            title: 'Upload',
            flex: true,
            color: Colors.black87,
            fontColor: Colors.white,
            padding: 14,
            onPressed: () async {
              Get.off(() => SuccessScreen(title: 'LaporanHarian Terkirim'));
            },
          ),
        ],
      ),
    );
  }
}
