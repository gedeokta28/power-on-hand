import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/auth_controller.dart';
import 'package:power_on_hand/ui/screens/register_screen.dart';
import 'package:power_on_hand/ui/widgets/half_color_button.dart';
import 'package:power_on_hand/ui/widgets/logo_bareskim.dart';
import 'package:power_on_hand/ui/widgets/rounded_text_field.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class LoginScreen extends StatelessWidget {
  final cEmail = TextEditingController();
  final cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldThreeTopCircleContainer(
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: Get.back,
                child: Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              LogoBareskimWidget(),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Power',
            style: GoogleFonts.varelaRound(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'On Hand',
              style: GoogleFonts.varelaRound(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 36),
          RoundedTextFieldWidget(
            hintText: 'Your Email',
            cText: cEmail,
          ),
          RoundedTextFieldWidget(
            hintText: 'Password',
            cText: cPassword,
            isPassword: true,
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(paddingX),
                child: Text(
                  'Login',
                  style: GoogleFonts.varelaRound(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  AuthController.to.login(
                    email: cEmail.text.trim(),
                    password: cPassword.text.trim(),
                  );
                },
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
          SizedBox(height: 42),
          Row(
            children: [
              HalfColorButtonWidget(
                text: 'Sign Up',
                color: Color(0xFF58BFE6),
                width: 90,
                onTap: () => Get.to(() => RegisterScreen()),
              ),
              Spacer(),
              HalfColorButtonWidget(
                text: 'Forgot Passwords',
                color: Color(0xFFFFAE48),
                width: 180,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
