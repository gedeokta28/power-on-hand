import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_upload_success.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class SpriInputKegiatanDirekturScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input Kegiatan Direktur',
      buttonText: 'Input',
      buttonOnTap: () {
        showToast('wip');
      },
      children: Column(
        children: [
          TextFieldWidget(
            title: 'Tanggal',
            hintText: '23/01/2021',
          ),
          TextFieldWidget(
            title: 'Kunjungan',
            maxLines: 4,
          ),
          TextFieldWidget(
            title: 'Rapat',
          ),
          TextFieldWidget(
            title: 'Press Release',
          ),
          TextFieldWidget(
            title: 'Tamu',
          ),
          TextFieldWidget(
            title: 'Makan Siang',
          ),
          SizedBox(height: 28),
          PrimaryButton(
            title: 'Upload',
            flex: true,
            color: Colors.black87,
            fontColor: Colors.white,
            padding: 14,
            onPressed: () {
              Get.off(() => BaseUploadSuccess());
            },
          ),
        ],
      ),
    );
  }
}
