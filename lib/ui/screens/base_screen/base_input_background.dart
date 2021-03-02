import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class BaseInputBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                // Blue Circle
                Positioned(
                  bottom: -150,
                  left: -150,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Color(0xFF58BFE6),
                      borderRadius: BorderRadius.circular(180),
                    ),
                  ),
                ),
                // Grey Circle
                Positioned(
                  bottom: -270,
                  right: -190,
                  child: Container(
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color(0xFF4C525C),
                      borderRadius: BorderRadius.circular(300),
                    ),
                  ),
                ),
                // Red Circle
                Positioned(
                  bottom: -250,
                  right: -280,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4848),
                      borderRadius: BorderRadius.circular(180),
                    ),
                  ),
                ),
                // Top Grey Circle
                Positioned(
                  top: -410,
                  left: -220,
                  child: Container(
                    width: 600,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Color(0xFF4C525C),
                      borderRadius: BorderRadius.circular(300),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: Get.back,
                            child: Icon(
                              FontAwesomeIcons.chevronLeft,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          PrimaryButton(
                            title: 'Input',
                            onPressed: () {},
                            color: Colors.black87,
                            fontColor: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(height: sy(22)),
                      SizedBox(
                        width: Get.width / 1.5,
                        child: Text(
                          'Input Kegiatan Direktur',
                          style: GoogleFonts.varelaRound(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: sy(28)),
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
                      SizedBox(height: sy(28)),
                      PrimaryButton(
                        title: 'Upload',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
