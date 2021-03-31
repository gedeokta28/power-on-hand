import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/utils/file_utils.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/widgets/input/base_dropdown_widget.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class AnggotaInputGiatPengamanScreen extends StatefulWidget {
  @override
  _AnggotaInputGiatPengamanScreenState createState() => _AnggotaInputGiatPengamanScreenState();
}

class _AnggotaInputGiatPengamanScreenState extends State<AnggotaInputGiatPengamanScreen> {
  final _formKey = GlobalKey<FormState>();
  PlatformFile pFile;

  var cDasarSprint = TextEditingController();
  var cNamaGiat = TextEditingController();
  var cLat = TextEditingController();
  var cLng = TextEditingController();
  var cDurasi = TextEditingController();
  var cFIle = TextEditingController();

  String duration;
  var listDurationData = [
    BaseDropdownModel(title: '3 jam', value: 'M'),
    BaseDropdownModel(title: '6 jam', value: 'M'),
    BaseDropdownModel(title: '9 jam', value: 'M'),
    BaseDropdownModel(title: '12 jam', value: 'M'),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input Giat Pengaman (PAM)',
      children: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
              title: 'Dasar Sprint',
              cText: cDasarSprint,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Dasar Sprint wajib diisi');
              },
            ),
            TextFieldWidget(
              title: 'Nama Giat',
              cText: cNamaGiat,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Nama Giat wajib diisi');
              },
            ),
            SizedBox(height: 8),
            Text(
              'Durasi : ',
              style: GoogleFonts.varelaRound(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            BaseDropdownWidget(
              value: duration,
              dropdownHintText: 'Pilih Durasi',
              listDropdownData: listDurationData,
              onChanged: (value) {
                setState(() {
                  duration = value;
                });
              },
            ),
            TextFieldWidget.file(
              title: 'File',
              cText: cFIle,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'File wajib diisi');
              },
              onTap: () async {
                var file = await FileUtils.openFileExplorer();
                if (file != null) {
                  setState(() {
                    pFile = file;
                  });
                  cFIle.text = file.name;
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
                  // AnggotaController.to.uploadLaporanHarian(
                  //   namaTsk: cNamaTsk.text,
                  //   affairID: _affairChosen.id,
                  //   pTkp: File(pTkp.path),
                  //   pBarangBukti: File(pBarangBukti.path),
                  //   pKartuIdentitas: File(pKartuIdentitas.path),
                  //   pSidikJari: File(pSidikJari.path),
                  // );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
