import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:power_on_hand/core/utils/file_utils.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class AnggotaUploadPenilainLapanganScreen extends StatefulWidget {
  @override
  _AnggotaUploadPenilainLapanganScreenState createState() => _AnggotaUploadPenilainLapanganScreenState();
}

class _AnggotaUploadPenilainLapanganScreenState extends State<AnggotaUploadPenilainLapanganScreen> {
  var cFilePenilaianLapangan = TextEditingController();
  var cKategoriPenilaian = TextEditingController();
  PlatformFile pFilePenilaianLapangan;

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Penilaian Lapangan',
      children: Column(
        children: [
          SizedBox(height: 20),
          TextFieldWidget(
            title: 'Kategori Penilaian',
            hintText: 'Pilih Kategori Penilaian',
            cText: cKategoriPenilaian,
            validator: (value) {
              return ValidateUtils.requiredField(value, 'Kategori Penilaian wajib diisi');
            },
            isReadOnly: true,
            // onTap: () async {
            //   var res = await Get.to(() => AffairListScreen());

            //   if (res != null) {
            //     // put result to affair
            //     _affairChosen = res;
            //     cKategoriPenilaian.text = _affairChosen.name;
            //   }
            // },
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
              // if (_formKey.currentState.validate()) {
              //   AnggotaController.to.uploadLaporanHarian(
              //     namaTsk: cNamaTsk.text,
              //     affairID: _affairChosen.id,
              //     pTkp: File(pTkp.path),
              //     pBarangBukti: File(pBarangBukti.path),
              //     pKartuIdentitas: File(pKartuIdentitas.path),
              //     pSidikJari: File(pSidikJari.path),
              //   );
              // }
            },
          ),
        ],
      ),
    );
  }
}
