import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/user_controller.dart';
import 'package:power_on_hand/core/utils/dialog_utils.dart';
import 'package:power_on_hand/core/utils/validate_utils.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class InputStatusDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final cStatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Center(
          child: Text(
            'Tambah fasilitas',
            style: GoogleFonts.varelaRound(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFieldWidget(
                hintText: 'Masukkan Status',
                cText: cStatus,
                validator: (value) {
                  return ValidateUtils.requiredField(value, 'Status wajib diisi');
                },
              ),
            ],
          ),
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
          RaisedButton(
            color: Styles.primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                UserController.to.updateStatus(status: cStatus.text);
                DialogUtils.closeDialog();
              }
            },
            child: Text(
              'Update',
              style: GoogleFonts.varelaRound(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
