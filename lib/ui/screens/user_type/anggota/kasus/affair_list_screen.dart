import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/controllers/anggota_controller.dart';

class AffairListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Daftar Perkara ',
            style: GoogleFonts.varelaRound(),
          ),
        ),
        body: Container(
          height: double.infinity,
          child: GetBuilder<AnggotaController>(
            autoRemove: false,
            builder: (_) {
              if (_.listAffair.isEmpty) {
                _.getAffairList();
                _.getProvisionList();
                return Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(height: 1),
                physics: BouncingScrollPhysics(),
                itemCount: _.listAffair.length,
                itemBuilder: (context, index) {
                  var affair = _.listAffair[index];
                  return ListTile(
                    onTap: () {
                      // return affair chosen
                      Get.back(result: affair);
                    },
                    dense: true,
                    title: Text(
                      affair.name,
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
