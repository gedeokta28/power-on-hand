import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class BaseBottomMenu extends StatelessWidget {
  final List<Widget> children;
  final String title;
  const BaseBottomMenu({
    Key key,
    @required this.children,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScaffoldThreeTopCircleContainer(
          customPaddingX: 0,
          children: Stack(
            children: [
              InkWell(
                onTap: Get.back,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(paddingX, 0, paddingX, paddingY),
                  child: Icon(
                    FontAwesomeIcons.chevronLeft,
                    size: 16,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(paddingX, 0, paddingX, paddingY),
                      child: Text(
                        title ?? '',
                        style: GoogleFonts.varelaRound(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(minHeight: Get.height - 200),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(paddingX, paddingY, paddingX, 8),
                          child: InkWell(
                            onTap: Get.back,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: sy(36),
                                height: sy(4),
                                margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ...children
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
