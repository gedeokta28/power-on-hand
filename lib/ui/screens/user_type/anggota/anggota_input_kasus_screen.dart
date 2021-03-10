import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class AnggotaInputKasusScreen extends StatefulWidget {
  @override
  _AnggotaInputKasusScreenState createState() => _AnggotaInputKasusScreenState();
}

class _AnggotaInputKasusScreenState extends State<AnggotaInputKasusScreen> {
  PlatformFile pfileLP;
  TextEditingController cLP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input LP',
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
            title: 'Uraian Laporan',
            maxLines: 3,
          ),
          TextFieldWidget(
            title: 'Dasar',
          ),
          TextFieldWidget.file(
            title: 'Identitas Pelapor',
          ),
          TextFieldWidget.file(
            title: 'Barang Bukti',
          ),
          TextFieldWidget(
            title: 'Motif',
          ),
          TextFieldWidget(
            title: 'Pasal',
          ),
          TextFieldWidget(
            title: 'Rencana Tindak Lanjut',
            maxLines: 3,
          ),
          SizedBox(height: sy(28)),
          PrimaryButton(
            title: 'Upload',
            flex: true,
            color: Colors.black87,
            fontColor: Colors.white,
            padding: 14,
            onPressed: () async {
              Get.off(() => SuccessScreen(title: 'LP Terkirim'));
            },
          ),
        ],
      ),
    );
  }
}
