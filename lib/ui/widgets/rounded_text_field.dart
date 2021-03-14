import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedTextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final Function validator;
  final bool isTheLast;
  final TextInputType keyboardType;

  final TextEditingController cText;

  const RoundedTextFieldWidget({
    Key key,
    @required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.cText,
    this.isPassword = false,
    this.isTheLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: validator,
        obscureText: isPassword,
        keyboardType: keyboardType,
        controller: cText,
        style: GoogleFonts.varelaRound(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
        textInputAction: isTheLast ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          errorStyle: GoogleFonts.varelaRound(
            fontSize: 14,
            color: Colors.red,
            fontWeight: FontWeight.w400,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.varelaRound(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
          // border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[300].withOpacity(0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}
