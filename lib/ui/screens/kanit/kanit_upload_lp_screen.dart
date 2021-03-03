import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_upload_success.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class KanitUploadLpScreen extends StatelessWidget {
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
              Get.off(() => BaseUploadSuccess());
            },
          ),
        ],
      ),
    );
  }
}

class TextAndChipWidget extends StatelessWidget {
  final String text;
  final String textChip;

  const TextAndChipWidget({
    Key key,
    @required this.text,
    @required this.textChip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: sy(8)),
        Text(
          text,
          style: GoogleFonts.varelaRound(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.all(sy(12)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0.1,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(180),
                ),
              ),
              SizedBox(width: sy(4)),
              Text(
                textChip,
                style: GoogleFonts.varelaRound(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
