import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/auth_controller.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/register_screen.dart';
import 'package:power_on_hand/ui/widgets/half_color_button.dart';
import 'package:power_on_hand/ui/widgets/logo_bareskim.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  final cEmail = TextEditingController();
  final cPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldThreeTopCircleContainer(
      children: Form(
        key: _formKey,
        child: Column(
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
            TextFieldWidget(
              hintText: 'Your Email',
              cText: cEmail,
              fillColor: Colors.grey[300].withOpacity(0.8),
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Email wajib diisi');
              },
            ),
            TextFieldWidget(
              hintText: 'Password',
              cText: cPassword,
              isPassword: true,
              fillColor: Colors.grey[300].withOpacity(0.8),
              validator: (value) {
                return ValidateUtils.requiredField(value, 'Password wajib diisi');
              },
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
                    if (_formKey.currentState.validate()) {
                      AuthController.to.login(
                        email: cEmail.text.trim(),
                        password: cPassword.text.trim(),
                      );
                    }
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
      ),
    );
  }
}
