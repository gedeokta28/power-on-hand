import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/login_screen.dart';
import 'package:power_on_hand/ui/widgets/half_color_button.dart';
import 'package:power_on_hand/ui/widgets/input/dropdown_widget.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final cName = TextEditingController();
  final cEmail = TextEditingController();
  final cPhone = TextEditingController();
  final cPassword = TextEditingController();

  int _titleId;
  void _dropdownCallback(int value) {
    setState(() {
      _titleId = value;
    });
    print(value);
  }

  @override
  void initState() {
    super.initState();
    UserController.to.getTitleList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF58BFE6),
        body: Container(
          // constraints: BoxConstraints(maxHeight: Get.height),
          child: SingleChildScrollView(
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
                        SizedBox(height: 22),
                        Text(
                          'Create \nAccount',
                          style: GoogleFonts.varelaRound(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: sy(14)),
                        TextFieldWidget(
                          fillColor: Colors.grey[300].withOpacity(0.8),
                          hintText: 'Name',
                          cText: cName,
                          validator: (value) {
                            return ValidateUtils.requiredField(value, 'Name wajib diisi');
                          },
                        ),
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
                          hintText: 'Password',
                          cText: cPassword,
                          validator: (value) {
                            return ValidateUtils.requiredField(value, 'Password wajib diisi');
                          },
                        ),
                        TextFieldWidget(
                          fillColor: Colors.grey[300].withOpacity(0.8),
                          hintText: 'No Handphone',
                          cText: cPhone,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            return ValidateUtils.requiredField(value, 'Phone wajib diisi');
                          },
                        ),
                        GetBuilder<UserController>(
                          builder: (_) {
                            return DropdownWidget(
                              dropdownCallback: _dropdownCallback,
                              dropdownValue: _titleId,
                              dropdownDataList: _.listTitle,
                            );
                          },
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(paddingX),
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.varelaRound(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Spacer(),
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(90),
                              child: InkWell(
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  var isValid = _formKey.currentState.validate();
                                  if (isValid) {
                                    UserController.to.register(
                                      name: cName.text.trim(),
                                      email: cEmail.text.trim(),
                                      phone: cPhone.text.trim(),
                                      password: cPassword.text.trim(),
                                      titleId: _titleId,
                                    );
                                  }
                                },
                                child: Ink(
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
                            ),
                          ],
                        ),
                        SizedBox(height: 48),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
