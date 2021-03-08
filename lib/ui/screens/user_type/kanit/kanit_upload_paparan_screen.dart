import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/screens/base_screen/success_screen.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class KanitUploadPaparanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input LP',
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
          TextFieldWidget(
            title: 'Upload LP',
            hintText: 'Max Size 500kb',
          ),
          SizedBox(height: sy(28)),
          PrimaryButton(
            title: 'Upload',
            flex: true,
            color: Colors.black87,
            fontColor: Colors.white,
            padding: 14,
            onPressed: () {
              Get.off(() => SuccessScreen(title: 'LP Terkirim'));
            },
          ),
        ],
      ),
    );
  }
}
