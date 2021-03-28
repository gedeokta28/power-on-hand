import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/controllers/anggota_controller.dart';
import 'package:power_on_hand/core/models/basic_list_model.dart';
import 'package:power_on_hand/core/models/laporan_model.dart';
import 'package:power_on_hand/core/utils/file_utils.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/list/kategori_penilaian_list_screen.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/list/laporan_list_screen.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class AnggotaUploadPenilainLapanganScreen extends StatefulWidget {
  @override
  _AnggotaUploadPenilainLapanganScreenState createState() => _AnggotaUploadPenilainLapanganScreenState();
}

class _AnggotaUploadPenilainLapanganScreenState extends State<AnggotaUploadPenilainLapanganScreen> {
  var cFilePenilaianLapangan = TextEditingController();
  var cKategoriPenilaian = TextEditingController();
  var cLaporan = TextEditingController();
  PlatformFile pFilePenilaianLapangan;
  final _formKey = GlobalKey<FormState>();

  BasicListModel choosenKategori;
  LaporanModel choosenLaporan;

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Penilaian Lapangan',
      children: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFieldWidget(
              title: 'Laporan',
              hintText: 'Pilih Laporan',
              cText: cLaporan,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Laporan wajib diisi');
              },
              isReadOnly: true,
              onTap: () async {
                var res = await Get.to(() => LaporanListScreen());
                if (res != null) {
                  // put result to affair
                  choosenLaporan = res;
                  cLaporan.text = choosenLaporan.id.toString();
                }
              },
            ),
            TextFieldWidget(
              title: 'Kategori Penilaian',
              hintText: 'Pilih Kategori Penilaian',
              cText: cKategoriPenilaian,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Kategori Penilaian wajib diisi');
              },
              isReadOnly: true,
              onTap: () async {
                var res = await Get.to(() => KategoriPenilaianListScreen());
                if (res != null) {
                  // put result to affair
                  choosenKategori = res;
                  cKategoriPenilaian.text = choosenKategori.name;
                }
              },
            ),
            TextFieldWidget.file(
              hintText: 'Masukkan File Penilaian',
              cText: cFilePenilaianLapangan,
              validator: (value) {
                return ValidateUtils.requiredField(
                  value,
                  'File Penilaian wajib diisi',
                );
              },
              onTap: () async {
                var file = await FileUtils.openFileExplorer();
                if (file != null) {
                  setState(() {
                    pFilePenilaianLapangan = file;
                  });
                  cFilePenilaianLapangan.text = file.name;
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
                  AnggotaController.to.uploadPenilaian(
                    kategoriId: choosenKategori.id.toString(),
                    laporanId: choosenLaporan.id.toString(),
                    pFile: File(pFilePenilaianLapangan.path),
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
