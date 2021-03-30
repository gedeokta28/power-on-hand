import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/laporan_controller.dart';
import 'package:power_on_hand/core/utils/file_utils.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/widgets/input/base_dropdown_widget.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class KanitUploadLaporanScreen extends StatefulWidget {
  @override
  _KanitUploadLaporanScreenState createState() => _KanitUploadLaporanScreenState();
}

class _KanitUploadLaporanScreenState extends State<KanitUploadLaporanScreen> {
  PlatformFile pfileLaporan;
  final cLaporan = TextEditingController();
  final cNomor = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String type;

  var listDropdownData = [
    BaseDropdownModel(title: 'Laporan Informasi', value: 'li'),
    BaseDropdownModel(title: 'Laporan Polisi', value: 'lp'),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input Laporan',
      children: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextAndChipWidget(
              text: 'Kepada',
              textChip: 'Kasubdit',
            ),
            TextAndChipWidget(
              text: 'Dari',
              textChip: 'Kanit',
            ),
            SizedBox(height: 8),
            Text(
              'Jenis Laporan',
              style: GoogleFonts.varelaRound(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            BaseDropdownWidget(
              value: type,
              dropdownHintText: 'Pilih Tipe Laporan',
              listDropdownData: listDropdownData,
              onChanged: (value) {
                setState(() {
                  type = value;
                });
              },
            ),
            TextFieldWidget(
              title: 'Nomor',
              hintText: 'Masukkan Nomor Surat',
              cText: cNomor,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Nomor wajib diisi');
              },
            ),
            TextFieldWidget.file(
              title: 'Upload Laporan',
              hintText: 'Max Size 500kb',
              cText: cLaporan,
              onTap: () async {
                var file = await FileUtils.openFileExplorer();
                if (file != null) {
                  setState(() {
                    pfileLaporan = file;
                  });
                  cLaporan.text = file.name;
                }
              },
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Laporan wajib diisi');
              },
            ),
            SizedBox(height: sy(28)),
            PrimaryButton(
              title: 'Upload',
              flex: true,
              color: Colors.black87,
              fontColor: Colors.white,
              padding: 14,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  LaporanController.to.uploadLaporan(
                    nomor: cNomor.text,
                    type: type,
                    file: File(pfileLaporan.path),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
