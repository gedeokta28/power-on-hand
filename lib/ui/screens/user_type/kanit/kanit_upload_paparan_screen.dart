import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/utils/file_utils.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class KanitUploadPaparanScreen extends StatefulWidget {
  @override
  _KanitUploadPaparanScreenState createState() => _KanitUploadPaparanScreenState();
}

class _KanitUploadPaparanScreenState extends State<KanitUploadPaparanScreen> {
  PlatformFile pfilePaparan;
  TextEditingController cPaparan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input Paparan',
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAndChipWidget(
            text: 'Kepada',
            textChip: 'Wadir',
          ),
          TextAndChipWidget(
            text: 'Dari',
            textChip: 'Kasubdit',
          ),
          TextFieldWidget.file(
            title: 'Upload Paparan',
            hintText: 'Max Size 500kb',
            cText: cPaparan,
            onTap: () async {
              var file = await FileUtils.openFileExplorer();
              if (file != null) {
                setState(() {
                  pfilePaparan = file;
                });
                cPaparan.text = file.name;
              }
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
              Get.off(() => SuccessScreen(title: 'Paparan Terkirim'));
            },
          ),
        ],
      ),
    );
  }
}
