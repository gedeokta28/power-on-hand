import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/core/models/grade_model.dart';

class GradeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Daftar Pangkat ',
            style: GoogleFonts.varelaRound(),
          ),
        ),
        body: Container(
          height: double.infinity,
          child: GetBuilder<UserController>(
            autoRemove: false,
            builder: (_) {
              if (_.listGrade.isEmpty) {
                _.getGradeList();
                return Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(height: 1),
                physics: BouncingScrollPhysics(),
                itemCount: _.listGrade.length,
                itemBuilder: (context, index) {
                  GradeModel grade = _.listGrade[index];
                  return ListTile(
                    onTap: () {
                      // return Grade chosen
                      Get.back(result: grade);
                    },
                    dense: true,
                    title: Text(
                      grade.name,
                      style: GoogleFonts.varelaRound(fontSize: 14),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
