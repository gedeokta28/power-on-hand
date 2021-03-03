import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';

class BaseInputBackground extends StatelessWidget {
  final Widget children;
  final String title;
  final String buttonText;
  final Function buttonOnTap;

  const BaseInputBackground({
    Key key,
    @required this.children,
    @required this.title,
    this.buttonText,
    this.buttonOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: Get.height - paddingY,
            ),
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
                  top: sy(-345),
                  left: sy(-200),
                  child: Container(
                    width: sy(500),
                    height: sy(500),
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
                          buttonText == null
                              ? SizedBox(height: sy(38))
                              : PrimaryButton(
                                  title: buttonText,
                                  onPressed: buttonOnTap ?? () {},
                                  color: Colors.black87,
                                  fontColor: Colors.white,
                                )
                        ],
                      ),
                      Container(
                        width: Get.width / 1.5,
                        height: sy(100),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: GoogleFonts.varelaRound(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      children
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
