import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/login_screen.dart';
import 'package:power_on_hand/ui/screens/register_success_screen.dart';
import 'package:power_on_hand/ui/widgets/half_color_button.dart';
import 'package:power_on_hand/ui/widgets/rounded_text_field.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF58BFE6),
        body: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Stack(
              children: [
                // Grey Circle
                Positioned(
                  top: -300,
                  left: -100,
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
                  bottom: -200,
                  right: -200,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4848),
                      borderRadius: BorderRadius.circular(140),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: Get.back,
                        child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: sy(22)),
                      Text(
                        'Create \nAccount',
                        style: GoogleFonts.varelaRound(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: sy(14)),
                      RoundedTextFieldWidget(hintText: 'Name'),
                      RoundedTextFieldWidget(hintText: 'Your Email'),
                      RoundedTextFieldWidget(hintText: 'Password'),
                      RoundedTextFieldWidget(hintText: 'No Handphone'),
                      RoundedTextFieldWidget(hintText: 'Daftar Sebagai'),
                      SizedBox(height: sy(14)),
                      Row(
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.varelaRound(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () => Get.off(() => RegisterSuccessScreen()),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF4C525C),
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: Icon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: sy(42)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: HalfColorButtonWidget(
                          text: 'Login',
                          color: Color(0xFF58BFE6),
                          width: 90,
                          onTap: () => Get.to(() => LoginScreen()),
                        ),
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
