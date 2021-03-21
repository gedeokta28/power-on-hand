import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/ui/screens/profile_screen.dart';
import 'package:power_on_hand/ui/screens/setting_profile_screen.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF0000),
              Color(0xFF2653F1).withOpacity(0.6),
            ],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: Get.height,
              width: 70,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NavigationItem(
                    title: 'My Profile',
                    icon: FontAwesomeIcons.userAlt,
                    onTap: () {
                      Get.to(() => ProfileScreen());
                    },
                  ),
                  NavigationItem(
                    title: 'Setting',
                    icon: FontAwesomeIcons.userCog,
                    onTap: () {
                      Get.to(() => SettingProfileScreen());
                    },
                  ),
                  NavigationItem(
                    title: 'Logout',
                    icon: FontAwesomeIcons.signOutAlt,
                    onTap: () {
                      UserController.to.logout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData icon;

  const NavigationItem({
    Key key,
    @required this.title,
    this.icon,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(border: Border(bottom: BorderSide())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 4, 12),
              child: Icon(
                icon,
                size: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.varelaRound(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
