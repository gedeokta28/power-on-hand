import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final bool addSuffixIcon;
  final bool hasShadow;
  final Color fillColor;

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
      this.fillColor,
      this.isReadOnly = false,
      this.addSuffixIcon = false,
      this.hasShadow = true,
      this.isPassword = false,
      this.isTheLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8),
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
          // decoration: !hasShadow
          //     ? null
          //     : BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //         boxShadow: [
          //           BoxShadow(
          //             blurRadius: 1,
          //             spreadRadius: 0.1,
          //             color: Colors.black.withOpacity(0.2),
          //             offset: Offset(0, 1),
          //           )
          //         ],
          //       ),
          child: TextFormField(
            maxLines: maxLines,
            readOnly: isReadOnly,
            onTap: onTap,
            validator: validator,
            obscureText: isPassword,
            keyboardType: keyboardType,
            onChanged: onChanged,
            style: GoogleFonts.varelaRound(fontSize: 14),
            controller: cText,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: !addSuffixIcon ? null : Icon(FontAwesomeIcons.solidFileAlt, color: Colors.black87),
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
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              fillColor: fillColor ?? Colors.white,
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

  factory TextFieldWidget.file({
    String title,
    String hintText,
    Function onTap,
    TextEditingController cText,
    Function validator,
  }) {
    return TextFieldWidget(
      title: title,
      hintText: hintText,
      addSuffixIcon: true,
      isReadOnly: true,
      onTap: onTap,
      cText: cText,
      validator: validator,
    );
  }
}
