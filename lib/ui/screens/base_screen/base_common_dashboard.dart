import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/ui/screens/navigation_screen.dart';
import 'package:power_on_hand/ui/widgets/dialog/input_dialog.dart';
import 'package:power_on_hand/ui/widgets/logo_bareskim.dart';

class BaseCommonDashboard extends StatelessWidget {
  final List<Widget> children;
  final String name;

  const BaseCommonDashboard({
    Key key,
    @required this.children,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Clippath
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFFC2424), Color(0xFF9D7AFF)],
                    ),
                  ),
                ),
              ),
              // Police Standing Image
              // Positioned(
              //   top: sy(140),
              //   right: sx(10),
              //   child: Image(
              //     image: AssetImage('assets/images/police_standing.png'),
              //     width: sx(150),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => NavigationScreen(), transition: Transition.fadeIn);
                          },
                          child: Icon(FontAwesomeIcons.alignLeft),
                        ),
                        Spacer(),
                        LogoBareskimWidget(),
                      ],
                    ),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: GetBuilder<UserController>(
                        builder: (_) {
                          return Text(
                            'HI, ${_?.user?.grade ?? ""} ${_?.user?.name ?? ""}',
                            style: GoogleFonts.varelaRound(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.dialog(InputStatusDialog());
                      },
                      child: GetBuilder<UserController>(
                        builder: (_) {
                          return Chip(
                            backgroundColor: Color(0xFF4DB4FF),
                            visualDensity: VisualDensity.compact,
                            label: Text(
                              _.user.work ?? '',
                              style: GoogleFonts.varelaRound(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            labelPadding: EdgeInsets.only(right: 4),
                            avatar: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: _.user.work == 'Dinas' ? Colors.greenAccent[400] : Colors.redAccent.shade400,
                                borderRadius: BorderRadius.circular(180),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 28),
                    ...children,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
