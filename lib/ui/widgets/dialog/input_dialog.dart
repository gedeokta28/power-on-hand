import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';

class InputStatusDialog extends StatelessWidget {
  final cStatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Center(
          child: Text(
            'Update Status',
            style: GoogleFonts.varelaRound(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text('Dinas', style: GoogleFonts.varelaRound()),
              onTap: () {
                UserController.to.updateStatus(status: 'Dinas');
              },
            ),
            ListTile(
              title: Text('Lepas Dinas', style: GoogleFonts.varelaRound()),
              onTap: () {
                UserController.to.updateStatus(status: 'Lepas Dinas');
              },
            ),
            ListTile(
              title: Text('Piket', style: GoogleFonts.varelaRound()),
              onTap: () {
                UserController.to.updateStatus(status: 'Piket');
              },
            ),
          ],
        ),
        actions: [
          OutlineButton(
            onPressed: () => DialogUtils.closeDialog(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            borderSide: BorderSide(color: Styles.primaryColor),
            child: Text(
              "Batal",
              style: TextStyle(color: Styles.primaryColor, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
