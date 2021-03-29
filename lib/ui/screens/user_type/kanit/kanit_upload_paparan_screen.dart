import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/paparan_controller.dart';
import 'package:power_on_hand/core/utils/file_utils.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class KanitUploadPaparanScreen extends StatefulWidget {
  @override
  _KanitUploadPaparanScreenState createState() => _KanitUploadPaparanScreenState();
}

class _KanitUploadPaparanScreenState extends State<KanitUploadPaparanScreen> {
  PlatformFile pfileLaporan;
  final cLaporan = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Upload Paparan',
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
                  PaparanController.to.uploadLaporan(file: File(pfileLaporan.path));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
