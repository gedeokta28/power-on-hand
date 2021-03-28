import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/controllers/anggota_controller.dart';
import 'package:power_on_hand/core/models/affair_model.dart';
import 'package:power_on_hand/core/models/provision_model.dart';
import 'package:power_on_hand/core/utils/file_utils.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/screens/user_type/anggota/list/affair_list_screen.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class AnggotaInputKasusScreen extends StatefulWidget {
  @override
  _AnggotaInputKasusScreenState createState() => _AnggotaInputKasusScreenState();
}

class _AnggotaInputKasusScreenState extends State<AnggotaInputKasusScreen> {
  final _formKey = GlobalKey<FormState>();

  PlatformFile pFileBukti;
  PlatformFile pFileIdentitas;

  AffairModel _affairChosen;
  ProvisionModel _provisionChosen;

  TextEditingController cUraian = TextEditingController();
  TextEditingController cDasar = TextEditingController();
  TextEditingController cRencana = TextEditingController();
  TextEditingController cMotif = TextEditingController();
  TextEditingController cBukti = TextEditingController();
  TextEditingController cIdentitas = TextEditingController();
  TextEditingController cPerkara = TextEditingController();
  TextEditingController cPasal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input Kasus',
      buttonText: 'Upload',
      buttonOnTap: () {
        if (_formKey.currentState.validate()) {
          AnggotaController.to.uploadKasus(
              uraian: cUraian.text,
              dasar: cDasar.text,
              rencana: cRencana.text,
              motif: cMotif.text,
              bukti: File(pFileBukti.path),
              identitas: File(pFileIdentitas.path),
              provisionID: _provisionChosen.id,
              affairID: _affairChosen.id);
        }
      },
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
              title: 'Uraian Laporan',
              maxLines: 3,
              cText: cUraian,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Uraian Laporan wajib diisi');
              },
            ),
            TextFieldWidget(
              title: 'Dasar',
              cText: cDasar,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Dasar wajib diisi');
              },
            ),
            TextFieldWidget.file(
              title: 'Identitas Pelapor',
              cText: cIdentitas,
              onTap: () async {
                var file = await FileUtils.openFileExplorer();
                if (file != null) {
                  setState(() {
                    pFileIdentitas = file;
                  });
                  cIdentitas.text = file.name;
                }
              },
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Identitas Pelapor wajib diisi');
              },
            ),
            TextFieldWidget.file(
              cText: cBukti,
              title: 'Barang Bukti',
              onTap: () async {
                var file = await FileUtils.openFileExplorer();
                if (file != null) {
                  setState(() {
                    pFileBukti = file;
                  });
                  cBukti.text = file.name;
                }
              },
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Barang Bukti wajib diisi');
              },
            ),
            TextFieldWidget(
              cText: cMotif,
              title: 'Motif',
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Motif wajib diisi');
              },
            ),
            TextFieldWidget(
              cText: cPerkara,
              title: 'Perkara',
              maxLines: 3,
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
                  // put provision from affair chosen
                  _provisionChosen = AnggotaController.to.getProvisionByAffairChosen(res.id);
                  cPasal.text = _provisionChosen.name;
                }
              },
            ),
            TextFieldWidget(
              cText: cPasal,
              title: 'Pasal',
              isReadOnly: true,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Pasal wajib diisi');
              },
            ),
            TextFieldWidget(
              cText: cRencana,
              title: 'Rencana Tindak Lanjut',
              maxLines: 3,
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Rencana wajib diisi');
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
