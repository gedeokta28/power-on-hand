import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController cText;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final Function validator;
  final bool isTheLast;
  final String title;
  final Function onTap;
  final bool isReadOnly;
  final String helperText;
  final int maxLines;
  final Function onChanged;

  TextFieldWidget(
      {this.title,
      this.cText,
      this.validator,
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.onTap,
      this.maxLines = 1,
      this.helperText,
      this.onChanged,
      this.isReadOnly = false,
      this.isPassword = false,
      this.isTheLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: sy(8)),
        title == null
            ? SizedBox()
            : Text(
                title,
                style: GoogleFonts.varelaRound(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
        SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0.1,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 1),
              )
            ],
          ),
          child: TextFormField(
            maxLines: maxLines,
            readOnly: isReadOnly,
            onTap: onTap,
            validator: validator,
            obscureText: isPassword,
            keyboardType: keyboardType,
            onChanged: onChanged,
            style: GoogleFonts.varelaRound(fontSize: 16),
            controller: cText,
            decoration: InputDecoration(
              helperText: helperText ?? null,
              helperStyle: GoogleFonts.varelaRound(
                fontStyle: FontStyle.italic,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.varelaRound(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              errorStyle: GoogleFonts.varelaRound(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            textInputAction: isTheLast ? TextInputAction.done : TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
