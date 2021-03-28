import 'package:custom_clippers/Clippers/sin_cosine_wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/core/models/basic_list_model.dart';
import 'package:power_on_hand/core/utils/helper_utils.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/screens/grade_list_screen.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class SettingProfileScreen extends StatefulWidget {
  @override
  _SettingProfileScreenState createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends State<SettingProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  var cGender = TextEditingController();
  var cPhone = TextEditingController();
  var cGrade = TextEditingController();
  var cBirthDate = TextEditingController();
  BasicListModel gradeChoosen;
  DateTime birthDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Clippath
            ClipPath(
              clipper: SinCosineWaveClipper(),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xE1FC2424), Color(0xFF9D7AFF)],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: Get.back,
                  child: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: Text(
                        'Setting My Profile',
                        style: GoogleFonts.varelaRound(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    TextFieldWidget(
                      fillColor: Colors.grey[300].withOpacity(0.8),
                      title: 'Nama :',
                      validator: (value) {
                        return ValidateUtils.requiredField(value, 'Nama wajib diisi');
                      },
                    ),
                    TextFieldWidget(
                      fillColor: Colors.grey[300].withOpacity(0.8),
                      title: 'Pangkat :',
                      isReadOnly: true,
                      cText: cGrade,
                      validator: (value) {
                        return ValidateUtils.requiredField(value, 'Pangkat wajib diisi');
                      },
                      onTap: () async {
                        var res = await Get.to(() => GradeListScreen());
                        if (res != null) {
                          // put result to grade
                          gradeChoosen = res;
                          cGrade.text = gradeChoosen.name;
                        }
                      },
                    ),
                    TextFieldWidget(
                      fillColor: Colors.grey[300].withOpacity(0.8),
                      title: 'Tanggal Lahir :',
                      cText: cBirthDate,
                      isReadOnly: true,
                      validator: (value) {
                        return ValidateUtils.requiredField(value, 'Tanggal Lahir wajib diisi');
                      },
                      onTap: () async {
                        var res = await HelperUtils.getDatePicker();
                        if (res != null) {
                          setState(() {
                            birthDate = res;
                          });
                          cBirthDate.text = DateFormat("dd MMMM yyyy").format(birthDate);
                        }
                      },
                    ),
                    TextFieldWidget(
                      fillColor: Colors.grey[300].withOpacity(0.8),
                      title: 'Jenis Kelamin :',
                      cText: cGender,
                      validator: (value) {
                        return ValidateUtils.requiredField(value, 'Jenis Kelamin wajib diisi');
                      },
                    ),
                    TextFieldWidget(
                      fillColor: Colors.grey[300].withOpacity(0.8),
                      title: 'No Handphone WA :',
                      cText: cPhone,
                      validator: (value) {
                        return ValidateUtils.requiredField(value, 'No Handphone WA wajib diisi');
                      },
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: PrimaryButton(
                        title: 'Save',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            UserController.to.updateProfile(
                              birthDate: birthDate,
                              gender: cGender.text,
                              phone: cPhone.text,
                              gradeId: gradeChoosen.id,
                            );
                          }
                        },
                        color: Colors.black87,
                        fontColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
