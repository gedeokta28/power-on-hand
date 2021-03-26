import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/controllers/anggota_controller.dart';
import 'package:power_on_hand/core/models/affair_model.dart';
import 'package:power_on_hand/core/utils/file_utils.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/kasus/affair_list_screen.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class AnggotaInputLaporanHarianScreen extends StatefulWidget {
  @override
  _AnggotaInputLaporanHarianScreenState createState() => _AnggotaInputLaporanHarianScreenState();
}

class _AnggotaInputLaporanHarianScreenState extends State<AnggotaInputLaporanHarianScreen> {
  TextEditingController cLaporanHarian = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  PlatformFile pTkp;
  PlatformFile pBarangBukti;
  PlatformFile pKartuIdentitas;
  PlatformFile pSidikJari;

  AffairModel _affairChosen;

  var cNamaTsk = TextEditingController();
  var cPerkara = TextEditingController();
  var cTkp = TextEditingController();
  var cBarangBukti = TextEditingController();
  var cKartuIdentitas = TextEditingController();
  var cSidikJari = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input Laporan Harian',
      children: Form(
        key: _formKey,
        child: Column(
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
              cText: cNamaTsk,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Nama TSK wajib diisi');
              },
            ),
            TextFieldWidget(
              title: 'Perkara',
              cText: cPerkara,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Perkara wajib diisi');
              },
              isReadOnly: true,
              onTap: () async {
                var res = await Get.to(() => AffairListScreen());

                if (res != null) {
                  // put result to affair
                  _affairChosen = res;
                  cPerkara.text = _affairChosen.name;
                }
              },
            ),
            TextFieldWidget.file(
              title: 'TKP',
              cText: cTkp,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'TKP wajib diisi');
              },
              onTap: () async {
                var file = await FileUtils.openFileExplorer();
                if (file != null) {
                  setState(() {
                    pTkp = file;
                  });
                  cTkp.text = file.name;
                }
              },
            ),
            TextFieldWidget.file(
              title: 'Barang Bukti',
              cText: cBarangBukti,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Barang Bukti wajib diisi');
              },
              onTap: () async {
                var file = await FileUtils.openFileExplorer();
                if (file != null) {
                  setState(() {
                    pBarangBukti = file;
                  });
                  cBarangBukti.text = file.name;
                }
              },
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
              cText: cKartuIdentitas,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'KTP/SIM/KARTU PELAJAR wajib diisi');
              },
              onTap: () async {
                var file = await FileUtils.openFileExplorer();
                if (file != null) {
                  setState(() {
                    pKartuIdentitas = file;
                  });
                  cKartuIdentitas.text = file.name;
                }
              },
            ),
            TextFieldWidget.file(
              hintText: 'FOTO SIDIK JARI',
              cText: cSidikJari,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'FOTO SIDIK JARI wajib diisi');
              },
              onTap: () async {
                var file = await FileUtils.openFileExplorer();
                if (file != null) {
                  setState(() {
                    pSidikJari = file;
                  });
                  cSidikJari.text = file.name;
                }
              },
            ),
            SizedBox(height: 28),
            PrimaryButton(
              title: 'Upload',
              flex: true,
              color: Colors.black87,
              fontColor: Colors.white,
              padding: 14,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  AnggotaController.to.uploadLaporanHarian(
                    namaTsk: cNamaTsk.text,
                    affairID: _affairChosen.id,
                    pTkp: File(pTkp.path),
                    pBarangBukti: File(pBarangBukti.path),
                    pKartuIdentitas: File(pKartuIdentitas.path),
                    pSidikJari: File(pSidikJari.path),
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
