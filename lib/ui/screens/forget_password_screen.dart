import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/forget_success_screen.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final cNrp = TextEditingController();
  final cEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF58BFE6),
        body: Container(
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
                child: Form(
                  key: _formKey,
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
                      SizedBox(height: 44),
                      Text(
                        'Forget\nPassword',
                        style: GoogleFonts.varelaRound(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 32),
                      TextFieldWidget(
                        fillColor: Colors.grey[300].withOpacity(0.8),
                        hintText: 'Your Email',
                        cText: cEmail,
                        validator: (value) {
                          return ValidateUtils.validateEmail(value);
                        },
                      ),
                      TextFieldWidget(
                        fillColor: Colors.grey[300].withOpacity(0.8),
                        hintText: 'NRP',
                        cText: cNrp,
                        validator: (value) {
                          return ValidateUtils.requiredField(value, 'NRP wajib diisi');
                        },
                      ),
                      SizedBox(height: 75),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.off(() => ForgetSuccessScreen());
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState.validate()) {
                              // UserController.to.login(
                              //   email: cEmail.text.trim(),
                              //   password: cPassword.text.trim(),
                              // );
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
