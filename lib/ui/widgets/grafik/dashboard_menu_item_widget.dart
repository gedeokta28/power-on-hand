import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';

class DashboardMenuItemWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final Widget widget;

  const DashboardMenuItemWidget({
    Key key,
    this.title,
    this.onTap,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Get.width / 7,
            height: Get.width / 7,
            child: widget == null ? SizedBox() : widget,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: sy(4)),
            decoration: BoxDecoration(
              color: Colors.red.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          title == null
              ? SizedBox()
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.varelaRound(
                    fontSize: 10,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}
